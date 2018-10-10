require 'sinatra'
require 'sinatra/reloader'
require 'sqlite3'
require 'active_record'

ActiveRecord::Base.establish_connection(
  :adapter => 'sqlite3',
  :database => 'database.db'
)

ActiveRecord::Base.logger = Logger.new( STDERR )

after do
  # This code will run after any specific route block runs. Sinatra feature.
  ActiveRecord::Base.connection.close
end

class Planet < ActiveRecord::Base
  has_many :moons
end

class Moon < ActiveRecord::Base
  belongs_to :planet
end

get "/planets/new" do
  erb :planets_new
end

post "/planets" do
  Planet.create(
    name:      params[:name],
    nick_name: params[:nick_name],
    period:    params[:period],
    img_url:   params[:img_url]
  )
  redirect "/planets"
end

get "/planets" do
  @planets = Planet.all
  erb :planets_index
end

get "/planets/:id" do
  @planet = Planet.find( params[:id] )
  erb :planets_show
end

get "/planets/:id/edit" do
  @planet = Planet.find( params[:id] )
  erb :planets_edit
end

post "/planets/:id" do
  planet = Planet.find( params[:id] )
  planet.update(
    name:      params[:name],
    nick_name: params[:nick_name],
    period:    params[:period],
    img_url:   params[:img_url]
  )
  redirect "planets/#{params[:id]}"
end

get "/planets/:id/delete" do
  planet = Planet.find( params[:id] )
  planet.destroy
  redirect "/planets"
end

get "/moons/new" do
  erb :moons_new
end

post "/moons" do
  Moon.create(
    name:           params[:name],
    period:         params[:period],
    discoverer:     params[:discoverer],
    discovery_year: params[:discovery_year],
    img_url:        params[:img_url],
    planet_id:      params[:planet_id]
  )
  redirect "/moons"
end

get "/moons" do
  @moons = Moon.all
  puts "="*50
  puts @moons
  erb :moons_index
end

get "/moons/:id" do
  @moon = Moon.find params[:id]
  erb :moons_show
end

get "/moons/:id/edit" do
  @moon = Moon.find params[:id]
  erb :moons_edit
end

post "/moons/:id" do
  moon = Moon.find params[:id]
  moon.update(
    name:           params[:name],
    period:         params[:period],
    discoverer:     params[:discoverer],
    discovery_year: params[:discovery_year],
    img_url:        params[:img_url],
    planet_id:      params[:planet_id]
  )
  redirect "/moons/#{params[:id]}"
end

get "/moons/:id/delete" do
  moon = Moon.find params[:id]
  moon.destroy
  redirect "/moons"
end
