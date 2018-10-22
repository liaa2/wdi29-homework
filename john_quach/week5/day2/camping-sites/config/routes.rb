Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  # Campsites CRUD routes

  # CREATE: blank form & form submit action
  get "/campsites/new" => "campsites#new"
  post "/campsites"    => "campsites#create"

  # READ: index & show
  get "/campsites" => "campsites#index"
  get "/campsites/:id" => "campsites#show", as: 'campsite'

  # UPDATE: prefilled form & form submit action
  get "/campsites/:id/edit" => "campsites#edit", as: 'campsite_edit'
  post "/campsites/:id"     => "campsites#update"

  # DELETE
  get "/campsites/:id/delete" => "campsites#destroy", as: 'campsite_destroy'

end
