Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html


 root to: "books#index"

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

end
