Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root to: "languages#index"

  #DELETE route
  get "/languages/:id/delete" => "languages#delete", as: 'language_destroy'

  #UPDATE routes
  post "/languages/:id" => "languages#update"
  get "/languages/:id/edit" => "languages#edit", as: 'language_edit'

  #CREATE routes
  post "/languages" => "languages#create"
  get "/languages/new" => "languages#new", as: 'language_new'

  #READ routes
  get "/languages" => "languages#index"
  get "/languages/:id" => "languages#show", as: 'language'

end
