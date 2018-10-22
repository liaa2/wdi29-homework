require 'sinatra'
require 'sinatra/reloader'
require 'pry'
require 'sqlite3'

# get '/mountains' do
#   "Hello World"
# end

def db_query(sql)
  db = SQLite3::Database.new("database.db") #connect to database
  db.results_as_hash = true
  puts "="*100
  p sql
  # puts sql.red
  puts "="*100
  result = db.execute( sql )
  db.close #close the connection
  result #this is what this method returns
end


get '/mountains' do
  #index page, show all mountains in the table
@result = db_query("SELECT * FROM mountains;")
erb :index
end

post "/mountains" do
  # CREATE: the form from the route below submits to here
  # puts params[:mountain_name]
  # CONSTRUCT a monster SQHELL to create a new mountain using data from the form.
  sql = "INSERT INTO mountains(mountain_name, mountain_continent, environment, height, image_url);"
  db_query(sql)
  redirect"/mountains"
end

get "mountains/new" do
  erb :new
end

  post "/mountains/:id" do
sql = "UPDATE mountains SET
mountain_name = '#{ params[:mountain_name]}',
mountain_continent = '#{ params[:mountain_continent]}',
environment = '#{ params[:environment]}',
height = #{ params[:height]},
image_url = '#{ params[:image_url]}'
WHERE id = #{params[:id]};"
db_query( sql )
redirect "/mountains/#{ params[:id]}"
end


get "/mountains/:id/delete" do
  sql = "DELETE FROM mountains WHERE id = #{ params[:id]};"
  db_query( sql )
  redirect "/mountains"
end

get "/mountains/:id/edit" do
  @mountain = db_query("SELECT * FROM mountains WHERE id=#{params[:id]};")
  @mountain = @mountain.first
  erb :edit
end


post "/mountains/:id/edit" do
  @mountain = db_query("SELECT * FROM mountains WHERE id=#{params[:id]};")
  @mountain = @mountain
  erb :edit
end


get "/mountains/:id" do
  @mountain = db_query("SELECT * FROM mountains WHERE id=#{params[:id]};")
  @mountain = @mountain.first
  erb :show
end
