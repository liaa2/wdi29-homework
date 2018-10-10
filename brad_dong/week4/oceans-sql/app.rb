require 'sinatra'
require 'sinatra/reloader'
require 'pry'
require 'sqlite3'

def db_query (sql)
  db = SQLite3::Database.new("database.db")
  db.results_as_hash = true
  result = db.execute(sql)
  db.close
  result
end


get '/oceans/new' do  #create new template
  erb :new
end

post '/oceans' do  #create new submit route
  sql = "INSERT INTO oceans (name, volume, area, colour, wetness)
  VALUES(
    '#{params[:name]}',
    '#{params[:volume]}',
    '#{params[:area]}',
    '#{params[:colour]}',
    '#{params[:wetness]}'
    );"

  db_query(sql)

  redirect "/index"

end


get '/oceans/:id/edit' do   #update input form
  @ocean = db_query("SELECT * FROM oceans WHERE id = #{params[:id]};")
  @ocean = @ocean.first
  erb :edit
end

post '/oceans/:id' do  #update submit route
  sql="UPDATE oceans SET
  name= '#{params[:name]}',
  volume= '#{params[:volume]}',
  area= '#{params[:area]}',
  colour= '#{params[:colour]}',
  wetness= '#{params[:wetness]}'
  WHERE id = #{params[:id]};"


  db_query(sql)

  redirect "/index/#{params[:id]}"
end




get "/index/:id" do   #show individual ocean
  @ocean = db_query("SELECT * FROM oceans WHERE id= #{params[:id]};")
  @ocean = @ocean.first
  erb :show
end

get '/oceans/:id/delete' do   #delete entry
  sql = "DELETE from oceans where id = #{params[:id]};"

  db_query(sql)

  redirect '/index'

end

get "/index" do   #show all oceans
  @results = db_query("SELECT * FROM oceans;")
  erb :index
end
