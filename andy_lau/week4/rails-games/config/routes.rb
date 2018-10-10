Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: "games#home"
  get "/games" => "games#home"
  # Guess Number routes
  get "/secret" => "secret_number#secret"
  get "/secret/result" => "secret_number#result"

  #EightBall routes
  get "/magic" => "eight_ball#magic"
  get "/magic/result" => "eight_ball#fortune"

  #RSP routes
  get "/rsp" => "rsp#play"
  get "/rsp/:throw" => "rsp#winner"


end
