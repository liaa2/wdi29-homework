require 'sinatra'
require 'sinatra/reloader'
require 'pry'
require 'httparty'


get "/" do
  erb :home
end

get "/search" do
  erb :search_form
end

get "/search/results" do
  API_KEY =  '24d863d54c86392e6e1df55b9a328755'
  API_BASE_URL = 'https://api.themoviedb.org/3'
  @query = params[ :query ]

  # lookup movie using themoviedb.org
  url = "#{API_BASE_URL}/search/movie?api_key=#{API_KEY}&query=#{@query}"
  puts "=" * 100, url

  response = HTTParty.get( url )
  @results = response['results']

  # we'll use this to construct a full image URL
  @img_base = 'http://image.tmdb.org/t/p/w185'

  erb :search_results
end

get "/show_movie_details/:id" do
  url = "https://api.themoviedb.org/3/movie/" + params["id"] + "?api_key=24d863d54c86392e6e1df55b9a328755"
  @results = HTTParty.get (url) 
  # binding.pry
  # @movies= results
erb :movie_details
end
