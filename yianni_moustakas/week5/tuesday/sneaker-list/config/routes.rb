Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root :to => "sneakers#index"

  #CREATE
  get "/sneakers/new" => "sneakers#new"
  post "/sneakers" => "sneakers#create"

  #READ
  get "/sneakers" => "sneakers#index"
  get "/sneakers/:id" => "sneakers#show", as: 'sneaker'

  # UPDATE
  get "/sneakers/:id/edit" => "sneakers#edit", as: 'sneaker_edit'
  post "/sneakers/:id" => "sneakers#update"

  #DELETE
  get "/sneakers/:id/delete" => "sneakers#destroy", as: "sneaker_destroy"
end
