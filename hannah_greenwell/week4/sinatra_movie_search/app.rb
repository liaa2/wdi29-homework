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
  API_KEY = "24d863d54c86392e6e1df55b9a328755"
  API_BASE_URL = "https://api.themoviedb.org/3"
  @query = params[:query]
  response = HTTParty.get("#{API_BASE_URL}/search/movie?api_key=#{API_KEY}&query=#{@query}")
  @results = response["results"]

  @img_base = "http://image.tmdb.org/t/p//w185"

  erb :search_results
end

get "/details/:id" do
  API_KEY = "24d863d54c86392e6e1df55b9a328755"
  API_BASE_URL = "https://api.themoviedb.org/3"
  id = params[:id]
  response = HTTParty.get("#{API_BASE_URL}/movie/#{id}?api_key=#{API_KEY}")
  @movie_details = response

  @img_base = "http://image.tmdb.org/t/p//w185"

  erb :movie_details
end
