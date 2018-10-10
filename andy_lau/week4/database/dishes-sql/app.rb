require 'sinatra'
require 'sinatra/reloader'
require 'sqlite3'
require 'active_record'

ActiveRecord::Base.establish_connection(
  adapter: 'sqlite3',
  database: 'database.db'
)

ActiveRecord::Base.logger = Logger.new( STDERR )

after do
  ActiveRecord::Base.connection.close
end

class Dish < ActiveRecord::Base
  has_many :restaurants
end

class Restaurant < ActiveRecord::Base
  belongs_to :dish
end

#CREATE 1
get "/dishes/new" do
  erb :dishes_new
end

#CREATE 2
post "/dishes" do
  Dish.create(
    name:        params[:name],
    origin:      params[:origin],
    flag_url:    params[:flag_url],
    ingredient:  params[:ingredient],
    description: params[:description],
    rating:      params[:rating],
    image_url:   params[:image_url]
  )

  redirect "/dishes"
end

#UPDATE 1
get "/dishes/:id/edit" do
  @dish = Dish.find(params[:id])
  erb :dishes_edit
end

#UPDATE 2
post "/dishes/:id" do
  Dish.find(params[:id]).update(
    name:        params[:name],
    origin:      params[:origin],
    flag_url:    params[:flag_url],
    ingredient:  params[:ingredient],
    description: params[:description],
    rating:      params[:rating],
    image_url:   params[:image_url]
  )

  redirect "/dishes/#{params[:id]}"
end

#DELETE
get "/dishes/:id/delete" do
  Dish.find(params[:id]).destroy

  redirect "/dishes"
end

#READ 1
get "/dishes" do
  @result = Dish.all
  erb :dishes_index
end

#READ 2
get "/dishes/:id" do
  @dish = Dish.find(params[:id])
  erb :dishes_show
end

###############


get "/restaurants/new" do
  erb :restaurants_new
end

post "/restaurants" do
  Restaurant.create(
    name:      params[:name],
    location:  params[:location],
    rating:    params[:rating],
    cost:      params[:cost],
    dish_id:   params[:dish_id]
  )

  redirect "/restaurants"
end

get "/restaurants" do
  @result = Restaurant.all
  erb :restaurants_index
end

get "/restaurants/:id/edit" do
  @restaurant = Restaurant.find(params[:id])
  erb :restaurants_edit
end

post "/restaurants/:id" do
  Restaurant.find(params[:id]).update(
    name:      params[:name],
    location:  params[:location],
    rating:    params[:rating],
    cost:      params[:cost],
    dish_id:   params[:dish_id]
  )
  redirect "/restaurants/#{ params[:id]}"
end

get "/restaurants/:id/delete" do
  Restaurant.find(params[:id]).destroy
  redirect "/restaurants"
end

get "/restaurants/:id" do
  @restaurant = Restaurant.find(params[:id])
  erb :restaurants_show
end
