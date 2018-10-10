require 'sinatra'
require 'sinatra/reloader'
require 'sqlite3'
require 'pry'

#Create a method for all our db queries
def db_query(sql)
  db = SQLite3::Database.new( "database.db" ) #connect to db
  db.results_as_hash = true #Get the results as a hash
  result = db.execute(sql)
  db.close
  result
end

#Change index to /mountains
#Edit should redirect to show page for that item
#Create to index page (listings)

get "/mountains" do
  erb :home
end

get "/mountains/" do
  erb :home
end

get "/mountains/:id/delete" do
  sql = "DELETE from mountains where id=#{params[:id]};"
  db_query(sql)
  redirect "/mountains"
end

get "/mountains/:id/edit" do
  sql = "SELECT * from mountains WHERE id = #{params[:id]};"
  @entry = db_query(sql)[0]
  erb :edit
end

post "/mountains/:id" do
  sql = "UPDATE mountains SET
  name = '#{params[:name]}',
  country = '#{params[:country]}',
  elevation = #{params[:elevation]},
  image = '#{params[:image]}'
  where id = #{params[:id]};"
  db_query(sql)
  redirect "/mountains/"
end

post "/mountains" do
  sql = "INSERT INTO mountains (name, country, image, elevation)
    VALUES (
      '#{params[:name]}', '#{params[:country]}', '#{params[:image]}',#{params[:elevation]}
    );"
  db_query(sql)

  redirect "/mountains"
end

get "/index" do
  @allmountains = db_query("SELECT * from mountains;")
  erb :index
end

get "/mountains/new" do
  erb :new
end

get "/mountains/:id" do
  @mountain = db_query("SELECT * from mountains where id = #{params[:id]};")[0]
  erb :show
end
