require 'sinatra'
require 'sinatra/reloader'
require 'pry'
require 'sqlite3'
require 'active_record'


ActiveRecord::Base.establish_connection( #connect
  adapter: 'sqlite3',  #database system being used
  database: 'database.db'  #database file name
)

ActiveRecord::Base.logger = Logger.new(STDERR)  #logs out SQL queries that active_record takes care of

after do  #then do this
  ActiveRecord::Base.connection.close
end


class Band < ActiveRecord::Base  #create class Band, inherits ActiveRecord def/methods
  has_many :songs #songs table has band_id field
end

class Song < ActiveRecord::Base
  belongs_to :band  #Song class belongs to Band class
end

#############################################
#Bands
##########################################

#Create form
get "/bands/new" do
  erb :bands_new
end

#Create submit
post "/bands" do
  Band.create(
    name: params[:name],
    no_of_members: params[:no_of_members],
    genre: params[:genre]
  )
  redirect "/bands"
end



#Read all
get "/bands" do
  @bands = Band.all
  erb :bands_index
end

#Read individual
get "/bands/:id" do
  @band = Band.find params[:id]
  erb :bands_show
end



#Update form
get "/bands/:id/edit" do
  @band = Band.find params[:id]
  erb :bands_edit
end

#Update submit
post "/bands/:id" do
  band = Band.find (params[:id])

  band.update(
    name: params[:name],
    no_of_members: params[:no_of_members],
    genre: params[:genre]
  )
  redirect "/bands/#{params[:id]}"
end


#Delete
get "/bands/:id/delete" do
  band = Band.find (params[:id])
  band.destroy
  redirect "/bands"

end


#####################################################
#songs
######################################################

#Create form
get "/songs/new" do
  erb :songs_new
end

#create songs submit
post "/songs" do
  Song.create(
    name: params[:name],
    band_id: params[:band_id]
  )
  redirect "/songs"
end
#

#show alls songs
get "/songs" do
  @songs = Song.all
  erb :songs_index
end

# #show individual song
get "/songs/:id" do
  @song = Song.find(params[:id])

  erb :songs_show
end
#
#
#
#update form
get "/songs/:id/edit" do
  @song =Song.find params[:id]
  erb :songs_edit
end
#
# #update form submit
post "/songs/:id" do
  song = Song.find params[:id]

  song.update(
    name: params[:name]
  )
  redirect "/songs/#{params[:id]}"
end
# #
# #
# #Delete song
get "/song/:id/delete" do
  song = Song.find params[:id]
  song.destroy
  redirect "/songs"
end
