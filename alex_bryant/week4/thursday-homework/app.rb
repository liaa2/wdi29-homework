# Mountains or Oceans
# Create a CRUD (Create, Read, Update, Delete) app for either Mountains or Oceans (or anything else that you pick).
#
# Make sure to include the following:
#
# A page of all records in your database (e.g. all mountains)
# A page that shows one record (e.g. one mountain)
# A way to create, update, and delete a record
# Make sure to use:
#
# SQL
# Seperate your concerns (with views for each action)
# Use a layout to hold all of your generic code

require 'sinatra'
require 'sinatra/reloader'
require 'pry'
require 'sqlite3'
require 'colorize'

def db_query sql
  db = SQLite3::Database.new( "database.db" )
  db.results_as_hash = true
  puts "=" * 50
  puts sql.red
  puts "=" * 50
  result = db.execute sql
  db.close
  result
end

get "/rock_bands" do
  @result = db_query "SELECT * FROM rock_bands;"
  #@result = @result.first
  erb :index
end

post "/rock_bands" do
  sql = "INSERT INTO rock_bands(name, genre, description, notable_songs, still_active, image_url, website_url)
    VALUES(
      \"#{params[:name]          }\",
      \"#{params[:genre]         }\",
      \"#{params[:description]   }\",
      \"#{params[:notable_songs] }\",
       #{params[:still_active]  },
      \"#{params[:image_url]     }\",
      \"#{params[:website_url]   }\"
    );"

    db_query sql
    redirect "/rock_bands"
end

get "/rock_bands/new" do
  erb :new
end

get "/rock_bands/:id/delete" do
  db_query "DELETE FROM rock_bands WHERE id = #{params[:id]}"
  redirect "/rock_bands"
end

get "/rock_bands/:id/edit" do
  @band = db_query "SELECT * FROM rock_bands WHERE id = #{params[:id]};"
  @band = @band.first
  erb :edit
end

post "/rock_bands/:id" do
  sql = "UPDATE rock_bands SET
    name =           \"#{params[:name]}\",
    genre =          \"#{params[:genre]}\",
    description =    \"#{params[:description]}\",
    notable_songs =  \"#{params[:notable_songs]}\",
    still_active =    #{params[:still_active]},
    image_url =      \"#{params[:image_url]}\",
    website_url =    \"#{params[:website_url]}\"
  WHERE id =          #{ params[:id]};"
  db_query sql
  redirect "/rock_bands/#{params[:id]}"
end

get "/rock_bands/:id" do
  @band = db_query "SELECT * FROM rock_bands WHERE id = #{params[:id]};"
  @band = @band.first
  erb :show
end
