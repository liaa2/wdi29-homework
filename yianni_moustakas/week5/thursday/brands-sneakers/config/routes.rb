Rails.application.routes.draw do
  resources :users, except: [:index] 

  get "/login" => "session#new"
  post "/login" => "session#create"
  delete "/login" => "session#destroy"
end
