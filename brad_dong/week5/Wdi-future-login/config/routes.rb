Rails.application.routes.draw do

  get '/login' =>'session#new'

  post '/login' => 'session#create'

  delete '/login' => 'session#destroy'

  resources :users, except: [:index]   # don't create the index action or template

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :futures

  resources :students
end
