Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root to: "world_leaders#index"

  ### CREATE
  get "/leaders/new" => "world_leaders#new"
  post "/leaders" => "world_leaders#create"

  ### READ
  get "/leaders" => "world_leaders#index"
  get "/leaders/:id" => "world_leaders#show", as: "leader"

  ### UPDATE
  get "/leaders/:id/edit" => "world_leaders#edit", as: "leader_edit"
  post "/leaders/:id" => "world_leaders#update"

  ### DELETE
  get "/leaders/:id/delete" => "world_leaders#destroy", as: "leader_destroy"

end
