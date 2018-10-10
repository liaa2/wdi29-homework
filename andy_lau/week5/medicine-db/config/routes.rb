Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html



  get "/medicines/:id/edit" => "medicines#edit", as: "medicine_edit"
  post "/medicines/:id" => "medicines#update"


  get "/medicines/new" => "medicines#new", as: 'medicine_new'
  post "/medicines" => "medicines#add"

  get "/medicines" => "medicines#index"
  get "/medicines/:id" => "medicines#show", as: "medicine"

  get "/medicines/:id/delete" => "medicines#destroy", as: "medicine_destroy"

end
