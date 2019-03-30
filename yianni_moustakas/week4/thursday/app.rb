require 'sinatra'
require 'sinatra/reloader'
require 'pry'
require 'sqlite3'
require 'colorize'

def db_query (sql)
  db = SQLite3::Database.new( "database.db" ) # connect to database
  db.results_as_hash = true
  result = db.execute(sql)
  db.close #close the connection
  result #this is what this method returns
end

get "/kicks" do
  @result = db_query("SELECT * FROM kicks;")
  erb :index
end

post "/kicks" do
  sql = "INSERT INTO kicks(brand, silhouette, colorway, description, heat_rating, drip_or_drop, release_date, image_url)
    VALUES(
      '#{params['brand']}',
      '#{params['silhouette']}',
      '#{params['colorway']}',
      '#{params['description']}',
      #{params['heat_rating']},
      #{params['drip_or_drop']},
      '#{params['release_date']}',
      '#{params['image_url']}'
    );"
  db_query(sql)
  redirect "/kicks"
end

get "/kicks/new" do
  erb :new
end

get "/kicks/:id/edit" do
  @kick = db_query("SELECT * FROM kicks WHERE id = #{params[:id]};")
  @kick = @kick.first
  erb :edit
end

post "/kicks/:id" do
  sql = "UPDATE kicks SET
    brand  = '#{ params[:brand] }',
    silhouette = '#{ params['silhouette']  }',
    colorway = '#{params['colorway']}',
    description = '#{ params['description']}',
    heat_rating = #{ params['heat_rating']  },
    drip_or_drop  = #{ params['drip_or_drop']},
    release_date  = #{ params['release_date']},
    image_url = '#{ params['image_url']  }'
    WHERE id = #{params['id']};"
  db_query( sql ) #execute UPDATE query and ignore result
  redirect "/kicks/#{ params['id'] }"
end

get "/kicks/:id/delete" do
  sql = "DELETE FROM kicks WHERE id = #{params[:id]};"
  db_query(sql)
  redirect "/kicks"
end

get "/kicks/:id" do
  @kick = db_query("SELECT * FROM kicks WHERE id = #{params[:id]};")
  @kick = @kick.first
  erb :show
end
