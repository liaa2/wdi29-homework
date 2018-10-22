Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  #CREATE routes
  get "/cars/new" => "cars#new"
  post "/cars" => "cars#create"

  #READ ROUTES
  get "cars" => "cars#index"
  get "/cars/:id" => "cars#show", as: 'car'

  # UPDATE
  get "/cars/:id/edit" => "cars#edit", as: 'planet_edit'
  post "cars/:id" => "cars#update"
  # DELETE
  get "/cars/:id/delete" => "cars#destroy", as: 'planet_destroy'


end
