Rails.application.routes.draw do

  root :to => 'tests#home'
  get '/tests' => 'tests#index'
  get '/home' => 'tests#home'

end
