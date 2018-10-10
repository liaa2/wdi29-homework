# Active Record homework
# import libraries
require 'sinatra'
require 'sinatra/reloader'
require 'pry'
require 'sqlite3'
require 'colorize'
require 'active_record'

# START Boilerplate code to use ActiveRecord #
# open a connection via Active Record
ActiveRecord::Base.establish_connection(
  adapter: 'sqlite3',
  database: 'database.db'
)
# create a logger
ActiveRecord::Base.logger = Logger.new(STDERR)
# close the connection with active record (good practice)
after do
  ActiveRecord::Base.connection.close
end
# Creating an association between the tables
# based on naming conventions and classes
class RockBand < ActiveRecord::Base
  has_many :rock_stars
end
class RockStar < ActiveRecord::Base
  belongs_to :rock_band
end
# END #


# (R from CRUD)
# Get requests to get all data about bands / stars
# for the index page
get "/rock_bands" do
  @bands = RockBand.all
  erb :rock_bands_index
end

get "/rock_stars" do
  @stars = RockStar.all
  erb :rock_stars_index
end


# (C from CRUD)
# Post requests to post new data to create new items in DB
post "/rock_bands" do

  RockBand.create(
    name:           params[:name],
    genre:          params[:genre],
    description:    params[:description],
    notable_songs:  params[:notable_songs],
    still_active:   params[:still_active],
    image_url:      params[:image_url],
    website_url:    params[:website_url]
  )

  redirect "/rock_bands"
end

post "/rock_stars" do

  puts params[:rock_band_id].to_s.green

  #We will need something like this to lookup on something other than id
  #band = RockBand.find params[:rock_band]
  #rock_band_id = band.id

  RockStar.create(
    first_name:   params[:first_name],
    last_name:    params[:last_name],
    instruments:  params[:instruments],
    alive:        params[:alive],
    image_url:    params[:image_url],
    rock_band_id: params[:rock_band_id]
  )

  redirect "/rock_stars"
end

# (C from CRUD)
# Get requests to go the the new page for creation
get "/rock_bands/new" do
  erb :rock_bands_new
end

get "/rock_stars/new" do
  @bands = RockBand.all
  erb :rock_stars_new
end


# (D from CRUD)
# Get requests delete and go to index
get "/rock_bands/:id/delete" do
  band = RockBand.find(params[:id]).destroy
  redirect "/rock_bands"
end

get "/rock_stars/:id/delete" do
  star = RockStar.find(params[:id]).destroy
  redirect "/rock_stars"
end


# (U from CRUD)
# Get requests to edit data
get "/rock_bands/:id/edit" do
  @band = RockBand.find params[:id]
  erb :rock_bands_edit
end

get "/rock_stars/:id/edit" do
  @bands = RockBand.all
  @star = RockStar.find params[:id]
  erb :rock_stars_edit
end


# (U from CRUD)
# Post requests to update the new data
post "/rock_bands/:id" do

  rock_band = RockBand.find params[:id]
  rock_band.update(
    name:           params[:name],
    genre:          params[:genre],
    description:    params[:description],
    notable_songs:  params[:notable_songs],
    still_active:   params[:still_active],
    image_url:      params[:image_url],
    website_url:    params[:website_url]
  )

  redirect "/rock_bands/#{params[:id]}"

end

post "/rock_stars/:id" do

  rock_star = RockStar.find params[:id]
  rock_star.update(
    first_name:   params[:first_name],
    last_name:    params[:last_name],
    instruments:  params[:instruments],
    alive:        params[:alive],
    image_url:    params[:image_url],
    rock_band_id: params[:rock_band_id]
  )

  redirect "/rock_stars/#{params[:id]}"

end


# (R from CRUD)
# Get requests to get data about individual bands / stars
# for individual pages
get "/rock_bands/:id" do
  @band = RockBand.find params[:id]
  erb :rock_bands_show
end

get "/rock_stars/:id" do
  @star = RockStar.find params[:id]
  erb :rock_stars_show
end
