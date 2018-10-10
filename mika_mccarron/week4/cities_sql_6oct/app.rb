require 'sinatra'
require 'sinatra/reloader'
require 'pry'
require 'sqlite3'
require 'active_record'

ActiveRecord::Base.establish_connection(
  adapter: 'sqlite3',
  database: 'database.db'
)

ActiveRecord:: Base.logger = Logger.new(STDERR)

after do
  ActiveRecord::Base.connection.close
end

class City < ActiveRecord::Base
  has_many :sites
end

class Site < ActiveRecord::Base
  belongs_to :city
end


get "/cities" do
  @result = City.all
  erb :cities_index
end

#write up to here first and then create index.erb

get"/cities/new" do
  erb :cities_new
end

post "/cities" do

  City.create(
    name:params[:name],
    country: params[:country],
    image_url: params[:image_url]
  )
redirect "/cities"
end

get "/cities/:id/edit" do
  @city = City.find( params[:id] )

  erb :cities_edit
end

post "/cities/:id" do
  city = City.find (params[:id])
  city.update(
    name:params[:name],
    country: params[:country],
    image_url: params[:image_url]
  )

  redirect "/cities/#{ params[:id]}"
end

get "/cities/:id/delete" do
  city = City.find (params[:id])
  city.destroy

  redirect "/cities"
end


get "/cities/:id" do
  @city = City.find(params[:id])

  erb :cities_show
end


#CRUD dor sites tablesitessites
#Create 1: Blank form
get "/sites/new" do
  erb :sites_new
end

post "/sites" do

  Site.create(
    name: params[:name],
    built_year: params[:built_year],
    architect: params[:architect],
    sites_id: params[:sites_id]
  )
redirect "/sites"
end

#READ: Index
get "/sites" do
  @sites = Site.all
  erb :sites_index
end

#READ: show
get "/sites/:id" do
  @site = Site.find params[:id]
  erb :sites_show
end

#UPDATE 1
get "/sites/:id/edit" do
  @site = Site.find params[:id]
  erb :sites_edit
end

#UPDATE 2
post "/sites/:id" do #error
  site = Site.find(params[:id])
  site.update(
    name: params[:name],
    built_year: params[:built_year],
    architect: params[:architect],
    sites_id: params[:sites_id]
  )
  redirect "/sites/#{ params[:id]}"
end

# Delete
get "sites/:id/delete" do
  site = Site.find.params[:id]
  site.destroy

  redirect "/sites" #redirect to index
end
