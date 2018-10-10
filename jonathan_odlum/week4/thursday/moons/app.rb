require 'sinatra'
require 'sinatra/reloader'
require 'pry'
require 'sqlite3'
require 'colorize'

def db_query( sql )
  db = SQLite3::Database.new( "database.db" ) #connect to database
  db.results_as_hash = true;
  puts sql.red
  result = db.execute( sql )
  db.close #close the connection
  result
end

get "/moons" do
  sql = "SELECT * FROM moons"
  @result = db_query( sql )
  erb :index
end

post "/moons" do
  puts params
  sql = "INSERT INTO moons( name, planet, period, discoverer, discovery_year, img_url)
    VALUES(
        '#{params[:name]}',
        '#{params[:planet]}',
         #{params[:period]},
        '#{params[:discoverer]}',
         #{params[:discovery_year]},
        '#{params[:img_url]}'
      );"

  db_query( sql )
  redirect "/moons"
end

get "/moons/new" do
  erb :new
end

get "/moons/:id/edit" do
  @moon = db_query( "SELECT * FROM moons WHERE id = #{ params[:id] };" ).last
  erb :edit
end


get "/moons/:id/delete" do
  sql = "DELETE FROM moons WHERE id = #{params[:id]};"
  db_query( sql )
  redirect "/moons"
end

get "/moons/:id" do
  sql = "SELECT * FROM moons WHERE id = #{params[:id]}"
  results = db_query( sql )
  @moon = results.last
  erb :show
end

post "/moons/:id" do
  sql = "UPDATE moons SET
          name           = '#{params[:name]}',
          planet         = '#{params[:planet]}',
          period         = #{params[:period]},
          discoverer     = '#{params[:discoverer]}',
          discovery_year = #{params[:discovery_year]},
          img_url        = '#{params[:img_url]}'
        WHERE id = #{params[:id]};"

  db_query( sql )
  redirect "/moons/#{params[:id]}"
end
