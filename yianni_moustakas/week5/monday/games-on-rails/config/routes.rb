Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  get "/games" => "games#home"


  get "/games/magic8ball" => "magic#home"
  get "/games/magic8ball/form" => "magic#question"
  get "/games/magic8ball/answer" => "magic#answer"

  get "/games/secretnumber" => "secret#secret_number"
  get "/games/secretnumber/guess" => "secret#guess"

  get "/games/rockpaperscissors" => "rps#rock_paper_scissors"
  get "/games/rockpaperscissors/play" => "rps#play"

end
