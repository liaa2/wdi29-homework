require 'sinatra'
require 'sinatra/reloader'
require 'pry'
require 'sqlite3'

def db_query( sql )
  db = SQLite3::Database.new( "database.db" )  # connect to database
  db.results_as_hash = true
  puts "======================================================"
  puts sql
  puts "======================================================"
  result = db.execute( sql )
  db.close  # close the connection
  result  # this is what this method returns
end

get "/standardpoodles" do
  # READ - index: show a list of all animals in the table
  @result = db_query( "SELECT * FROM standardpoodles;" )
  erb :index
end


get "/standardpoodles/new" do
  # CREATE part 1: The blank for for creating a new animal
  # The form submits to the route below due to the <form action="/animals" method="post"> tag
  erb :new
end

post "/standardpoodles" do
  # CREATE part 2: The form from the route above submits to here
  # Construct a monster SQHell query to create a new animal using the data from the form (which is in params)
  sql = "INSERT INTO standardpoodles( name, color, age, temperment, award,image_url)
           VALUES(
             '#{ params[:name] }',
             '#{ params[:color]  }',
             '#{ params[:age]    }',
             '#{ params[:temperment]}',
             '#{ params[:award]  }',
             '#{ params[:image_url]  }'
           );"

  # ^ NOTE: we can actually put quotes around the integer values too, and Sqlite will convert them
  # to integer values for us; putting qoutes around them will prevent our SQL query from breaking
  # if the form field is left blank (`age = '',` is valid SQL, but `age = ,` is not)

  db_query( sql )      # Run the query to insert the new animal, and ignore any return value

  redirect "/standardpoodles"  # This submit route does not have its own template, it redirects to the index instead
end


get "/standardpoodles/:id/edit" do
  # UPDATE part 1: get the item's data from the database, and use it to prefill the edit form
  # This form submits to the route below, due to its <form action="/animals/<%= @animal['id'] %>" method="post"> tag
  @standardpoodle = db_query( "SELECT * FROM standardpoodles WHERE id = #{ params[:id] };" )
  @standardpoodle = @standardpoodle.first # pull out just the first result from the result array
  erb :edit
end

post "/standardpoodles/:id" do
  # UPDATE part 2: handle the form submission: plug in the form values
  # to an SQL UPDATE query, to update this item... and then redirect to the show page
  sql = "UPDATE standardpoodles SET
  name = '#{ params[:name] }',
  color = '#{ params[:color]  }',
  age = '#{ params[:age]    }',
  temperment= '#{ params[:temperment]}',
  award= '#{ params[:award]  }',
  image_url = '#{ params[:image_url]  }'
    WHERE id = #{ params[:id] };"

  db_query( sql )  # execute UPDATE query and ignore result

  redirect "/standardpoodles/#{ params[:id] }"   # redirect to show page for this item
end


get "/standardpoodles/:id/delete" do
  # DELETE: delete the item (table row) by its ID, and redirect to the index
  sql = "DELETE FROM standardpoodles WHERE id = #{ params[:id] };"
  db_query( sql )  # execute DELETE query and ignore result
  redirect "/standardpoodles"  # redirect to index
end


# This route will catch /animals/ANYTHING , including a path like
# /animals/new  ... so we have to put more specific routes like
# /animals/new BEFORE this more general route
get "/standardpoodles/:id" do
  # READ - show: displays the details for a single item (row)
  @standardpoodle = db_query( "SELECT * FROM animals WHERE id = #{ params[:id] };" )
  @standardpoodle = @standardpoodle.first # pull out just the first result from the result array
  erb :show
end
