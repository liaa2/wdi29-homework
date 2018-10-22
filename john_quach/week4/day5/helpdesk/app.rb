require 'sinatra'
require 'sinatra/reloader'
require 'pry'
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

class Technician < ActiveRecord::Base
  has_many :issues
end

class Issue < ActiveRecord::Base
  belongs_to :technician
end

#binding.pry

get "/technicians" do

  @technicians = Technician.all

  erb :technicians_index

end

#CREATE - part 1
get "/technicians/new" do
  erb :technicians_new
end

#CREATE - part2
post "/technicians" do
    Technician.create(
      name:            params[:name] ,
      department:      params[:department]  ,
      location:        params[:location]    ,
      country:         params[:country],
      certification:   params[:certification]  ,
      level:           params[:level]      ,
      on_call:         params[:on_call],
      image_url:       params[:image_url]
    )

  redirect "/technicians"
end

get "/technicians/:id/edit" do

  @technicians = Technician.find( params[:id] )

  erb :technicians_edit
end

post "/technicians/:id" do

  technicians = Technician.find( params[:id] )
  technicians.update(
    name:          params[:name] ,
    department:    params[:department]  ,
    location:      params[:location]    ,
    certification: params[:certification],
    level:         params[:level]  ,
    on_call:       params[:on_call]      ,
    image_url:     params[:image_url]
  )

  redirect "/technicians/#{ params[:id] }"
end

get "/technicians/:id/delete" do
  technicians = Technician.find( params[:id] )
  technicians.destroy

  redirect "/technicians"
end

get "/technicians/:id" do

  @technicians = Technician.find( params[:id] )

  erb :technicians_show
end

## Issues table

get "/issues/new" do
  erb :issues_new
end

get "/issues" do
  @issues = Issue.all
  erb :issues_index
end

get "/issues/:id" do

  @issue = Issue.find( params[:id] )

  erb :issues_show
end

post "/issues" do

  Issue.create(
    summary:          params[:summary],
    description:      params[:description],
    cust_name:        params[:cust_name],
    business_unit:    params[:business_unit],
    priority:         params[:name],
    category:         params[:cetegory],
    resolved:         params[:resolved],
    resolution:       params[:resolution],
    technician_id:    params[:technician_id]
  )

  redirect "/issues"
end

# update 1
get "/issues/:id/edit" do
  @issue = Issue.find params[:id]
  erb :issues_edit
end

post "/issues/:id" do

  issue = Issue.find( params[:id] )
  issue.update(
    summary:          params[:summary],
    description:      params[:description],
    cust_name:        params[:cust_name],
    business_unit:    params[:business_unit],
    priority:         params[:name],
    category:         params[:cetegory],
    resolved:         params[:resolved],
    resolution:       params[:resolution],
    technician_id:    params[:technician_id]
  )

  redirect "/issues/#{ params[:id] }"
end

get "/issues/:id/delete" do
  issues = Issue.find params[:id]
  issues.destroy

  redirect "/issues"
end
