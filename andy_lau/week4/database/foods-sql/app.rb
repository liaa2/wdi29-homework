require 'sinatra'
require 'sinatra/reloader'
require 'sqlite3'

def db_query( sql )
  db = SQLite3::Database.new( "database.db" ) 
  db.results_as_hash = true
  result = db.execute( sql )
  db.close
  result
end

get "/food" do
  @result = db_query("SELECT * FROM food")
  erb :index
end

post "/food" do
  sql = "INSERT INTO food( name, country, country_img, main_ingredient, description, score, edible, image_url)
          VALUES(
            '#{params[:name]}',
            '#{params[:country]}',
            '#{params[:country_img]}',
            '#{params[:main_ingredient]}',
            '#{params[:description]}',
            #{params[:score]},
            #{params[:edible]},
            '#{params[:image_url]}'
          );"

    db_query(sql)

    redirect "/food"
end

get "/food/new" do
  erb :new
end

get "/food/:id/edit" do
  @food = db_query("SELECT * FROM food WHERE id = #{params[:id]};")
  @food = @food.first
  erb :edit
end

post "/food/:id" do
  sql = "UPDATE food SET
            name            = '#{params[:name]}',
            country         = '#{params[:country]}',
            country_img     = '#{params[:country_img]}',
            main_ingredient = '#{params[:main_ingredient]}',
            description     = '#{params[:description]}',
            score           = #{params[:score]},
            edible          = #{params[:edible]},
            image_url       = '#{params[:image_url]}'
            WHERE id = #{params[:id]};"
  db_query(sql)

  redirect "/food/#{params[:id]}"
end

get "/food/:id/delete" do
  sql = "DELETE FROM food WHERE id = #{params[:id]};"
  db_query(sql)
  redirect "/food"
end

get "/food/:id" do
  @food = db_query("SELECT * FROM food WHERE id = #{params[:id]};")
  @food = @food.first
  erb :display
end
