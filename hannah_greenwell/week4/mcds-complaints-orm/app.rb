require 'sinatra'
require 'sinatra/reloader'
require 'active_record'
require 'pry'

##### DB CONNECTION #####
ActiveRecord::Base.establish_connection(
  adapter: 'sqlite3',
  database: 'database.db'
)

ActiveRecord::Base.logger = Logger.new(STDERR)

after do
  ActiveRecord::Base.connection.close
end

class Customer < ActiveRecord::Base
  has_many :complaints
end

class Complaint < ActiveRecord::Base
  belongs_to :customer
end
##########

##### COMPLAINT ROUTE BLOCKS #####
get '/complaints/new' do
  @customers = Customer.all
  erb :complaints_new
end

post '/complaints' do
  Complaint.create(
    date_made: params[:date_made],
    title: params[:title],
    content: params[:content],
    customer_id: params[:customer_id]
  )

  redirect '/complaints'
end

get '/complaints' do
  @complaints = Complaint.all
  erb :complaints_index
end

get '/complaints/:id' do
  @complaint = Complaint.find params[:id]
  erb :complaints_show
end

get '/complaints/:id/edit' do
  @complaint = Complaint.find params[:id]
  @customers = Customer.all
  erb :complaints_edit
end

post '/complaints/:id' do
  complaint = Complaint.find params[:id]

  complaint.update(
    date_made: params[:date_made],
    title: params[:title],
    content: params[:content],
    customer_id: params[:customer_id]
  )

  redirect "/complaints/#{params[:id]}"
end

get '/complaints/:id/delete' do
  complaint = Complaint.find params[:id]
  complaint.destroy

  redirect '/complaints'
end
##########

##### CUSTOMER ROUTE BLOCKS #####
get '/customers/new' do
  erb :customers_new
end

post '/customers' do
  Customer.create(
    name: params[:name],
    city: params[:city],
    state: params[:state],
    disgruntled_rating: params[:disgruntled_rating],
    image_url: params[:image_url]
  )

  redirect '/customers'
end

get '/customers' do
  @customers = Customer.all
  erb :customers_index
end

get '/customers/:id' do
  @customer = Customer.find params[:id]
  erb :customers_show
end

get '/customers/:id/edit' do
  @customer = Customer.find params[:id]
  erb :customers_edit
end

post '/customers/:id' do
  customer = Customer.find params[:id]
  customer.update(
    name: params[:name],
    city: params[:city],
    state: params[:state],
    disgruntled_rating: params[:disgruntled_rating],
    image_url: params[:image_url]
  )

  redirect "/customers/#{params[:id]}"
end

get '/customers/:id/delete' do
  customer = Customer.find params[:id]
  customer.destroy

  redirect '/customers'
end
##########
