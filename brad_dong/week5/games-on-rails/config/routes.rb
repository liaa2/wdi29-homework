Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  #home
  root to: "games#home"
  # get "/games" => "games#home"


  #magic 8
  get "/games/magic" => "magic#play"

  get "/games/magic/answer" => "magic#answer"


  #secret number
  get "/games/secret" =>"secret#guess"

  get "/games/secret/result" => "secret#result"

  #rock paper scissors
  get "/games/rps" => "rps#pick"

  get "/games/rps/:rps_result" => "rps#rps_result"


end
