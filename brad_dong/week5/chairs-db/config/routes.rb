Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

#create blank
  get "/chairs/new"=>"chairs#new"

#submit create form
  post "/chairs"=> "chairs#create"

#show all
  get "/chairs" => "chairs#index"

#show one
  get "/chairs/:id" => "chairs#show", as: 'chair'

#update blank form
  get "/chairs/:id/edit" => "chairs#edit", as: 'chair_edit'

#submit edit form
  post "/chairs/:id" => "chairs#update"

#delete post
  get "/chairs/:id/delete" =>"chair#destroy", as: 'chair_destroy'

end
