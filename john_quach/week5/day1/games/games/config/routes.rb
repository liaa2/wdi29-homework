Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  # Home Page
  root :to => 'pages#home'
  get '/games' => 'pages#home'

  # Magic 8 Ball Routes
  get '/games/8ball' => 'games#eight_ball'
  get '/games/8ball/result' => 'games#eight_ball_result'

  # Secret Number Routes
  get '/games/secretnumber' => 'games#secret_number'
  get '/games/secretnumber/result' => 'games#secret_number_result'

end
