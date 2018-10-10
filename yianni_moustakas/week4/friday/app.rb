require 'sinatra'
require 'sinatra/reloader'
require 'pry'
require 'sqlite3'
require 'colorize'
require 'active_record'

ActiveRecord::Base.establish_connection(
  adapter: 'sqlite3',
  database: 'database.db',
)

ActiveRecord::Base.logger = Logger.new(STDERR)

after do
  ActiveRecord::Base.connection.close
end

class Brand < ActiveRecord::Base
  has_many :athletes
end

class Athlete < ActiveRecord::Base
  belongs_to :brands
end


get "/brands" do
  @result = Brand.all
  erb :brands_index
end

post "/brands" do
  Brand.create(
      company_name:  params[:company_name],
      website:       params[:website]     ,
      founded:       params[:founded]     ,
      hq:            params[:hq]          ,
      ceo:           params[:ceo]         ,
      revenue:       params[:revenue]     ,
      stock_price:   params[:stock_price] ,
      logo_url:      params[:logo_url]
    )
  redirect "/brands"
end

get "/brands/new" do
  erb :brands_new
end

get "/brands/:id/edit" do
  @brand = Brand.find(params[:id])
  erb :brands_edit
end

post "/brands/:id" do
  brand = Brand.find(params[:id])

  brand.update(
    company_name:  params[:company_name],
    website:       params[:website]     ,
    founded:       params[:founded]     ,
    hq:            params[:hq]          ,
    ceo:           params[:ceo]         ,
    revenue:       params[:revenue]     ,
    stock_price:   params[:stock_price] ,
    logo_url:      params[:logo_url]
  )
  redirect "/brands/#{params[:id]}"
end

get "/brands/:id/delete" do
  brand = Brand.find(params[:id])
  brand.destroy
  redirect "/brands"
end

get "/brands/:id" do
  @brand = Brand.find( params[:id] )
  erb :brands_show
end

##############################################################################


get "/athletes" do
  @athletes = Athlete.all
  erb :athletes_index
end

get "/athletes/new" do
  erb :athletes_new
end

post "/athletes" do

  Athlete.create(
    full_name:       params[:full_name],
    age:             params[:age],
    club:            params[:club],
    country:         params[:country],
    sponsored_brand:           params[:sponsored_brand],
    club_image:      params[:club_image],
    country_image:   params[:country_image],
    self_image:      params[:self_image]
  )
  redirect "/athletes"
end

get "/athletes/:id/edit" do
  @athlete = Athlete.find params[:id]
  erb :athletes_edit
end

post "/athletes/:id" do
  athlete = Athlete.find(params[:id])

  athlete.update(
    full_name:       params[:full_name],
    age:             params[:age],
    club:            params[:club],
    country:         params[:country],
    sponsored_brand: params[:sponsored_brand],
    club_image:      params[:club_image],
    country_image:   params[:country_image],
    self_image:      params[:self_image]
  )

  redirect "/athletes/#{params[:id]}"
end

get "/athletes/:id/delete" do
  athlete = Athlete.find params[:id]
  athlete.destroy
  redirect "/athletes"
end

get "/athletes/:id" do
  @athlete = Athlete.find params[:id]
  erb :athletes_show
end
