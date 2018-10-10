Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  #############CRUD THINGS###############

  ##CREATE 1 Form for new entry
  get "/mountains/new" => "mountains#new"

  ##CREATE 2  Process new entry form
  post "/mountains" => "mountains#create"

  ##READ 1 index of all entries
  get "/mountains" => "mountains#index"

  ##READ 2 show page
  get "mountains/:id" => "mountains#show", as: "mountain"

  ###UPDATE1 - Show the update form
  get "/mountains/:id/edit" => "mountains#edit", as: "mountain_edit"

  ###UPDATE2 - submit action of the form
  post "/mountains/:id" => "mountains#update"


  ##DELETE - get rid of the item
  get "mountains/:id/delete"  => "mountains#destroy", as: "mountain_destroy"

end
