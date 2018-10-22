Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html


get "/games" => "games#select"


get "/games/magicBall" => "games#magicBall"
get "/games/secretNumber" => "games#secretNumber"
get "/games/rockPaperScissors" => "games#rockPaperScissors"

end
