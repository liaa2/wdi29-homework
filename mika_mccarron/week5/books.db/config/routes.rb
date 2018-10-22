Rails.application.routes.draw do

  get 'users/new'
  get 'users/create'
  get 'users/show'
  get 'users/edit'
  get 'users/update'
  get 'users/destroy'
  # session routes
  get    "/login" => "session#new"     # login form
  post   "/login" => "session#create"  # form submits here to perform login and set session
  delete "/login" => "session#destroy" # logout (delete session)


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html


 root to: "books#  index"

#Created

  get "/books/new" => "books#new"
  post "/books" => "books#create"


#READ
  get "/books" => "books#index"
  get "/books/:id" => "books#show", as:'book'

#UPDATE
  get "/books/:id/edit" => "books#edit", as: 'book_edit'
  post "/books/:id" =>"books#update"


  get "/books/:id/delete" => "books#destroy", as:'book_destroy'


  resources :authors
  resources :users


end
