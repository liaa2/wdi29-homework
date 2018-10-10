require 'sinatra'
require 'sinatra/reloader'
require 'pry'
require 'active_record'
require 'sqlite3'

#Start with active_record database connection

ActiveRecord::Base.establish_connection(
  adapter: 'sqlite3',
  database: 'database.db'
)

after do
  ActiveRecord::Base.connection.close
end

class Author < ActiveRecord::Base
  has_many :papers
end

class Paper < ActiveRecord::Base
  belongs_to :author
end

post "/authors" do
  Author.create(
    name: params[:name],
    age: params[:age],
    country: params[:country],
    profile_pic: params[:profile_pic],
    alive: params[:alive],
    website: params[:website]
  )
  redirect "/authors"
end

get "/authors" do
  @authors = Author.all
  erb :authors_index
end

get "/authors/new" do
  erb :authors_new
end


get "/authors/:id/edit" do
  @author = Author.find(params[:id])
  erb :authors_edit
end

post "/authors/:id" do
  author = Author.find(params[:id])
  author.update(
      name: params[:name],
      age: params[:age],
      country: params[:country],
      profile_pic: params[:profile_pic],
      alive: params[:alive],
      website: params[:website],
    )
  redirect "authors/#{params[:id]}"
end

get "/authors/:id/delete" do
  author = Author.find(params[:id])
  author.destroy
  redirect "/authors"
end

get "/authors/:id" do
  @author = Author.find(params[:id])
  erb :authors_show
end


#############################################################
#Paper part
#############################################################
#create
#read
#update
#delte

#CREATE 1: blank form
get "/papers/new" do
  erb :papers_new
end

#CREATE 2: form submits to here. Redirect to index
post "/papers" do

  Paper.create(
    title: params[:title],
    year: params[:year],
    citations: params[:citations],
    web_link: params[:web_link],
    author_id: params[:author_id]
  )
  redirect "/papers"
end

#READ : index
get "/papers" do
  @papers = Paper.all #get every row in the table
  erb :papers_index
end

#READ : show
get "/papers/:id" do
  @paper = Paper.find params[:id]
  erb :papers_show
end


#UPDATE1 : show update form with values pre-populated
get "/papers/:id/edit" do
  @paper = Paper.find params[:id]
  erb :papers_edit
end

#UPDATE2 : edit form submits to here. redirect to show page
post "/papers/:id" do
  paper = Paper.find(params[:id])
  paper.update(
    title: params[:title],
    year: params[:year],
    citations: params[:citations],
    web_link: params[:web_link],
    author_id: params[:author_id]
  )
  redirect "papers/#{params[:id]}"
end

#DELETE
get "/papers/:id/delete" do
  paper = Paper.find(params[:id])
  paper.destroy
  redirect "/papers"
end
