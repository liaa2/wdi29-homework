Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root to: "games#home"

  get "/games" => "games#home"

  #====================================#
  #eightball routes
  #====================================#
  get "/games/eightball" => "eightball#question"
  get "/games/eightball/answer" => "eightball#answer"

  #====================================#
  #Secret Number routes
  #====================================#
  get "/games/secretnumber" => "secretnumber#guess"
  get "/games/secretnumber/guess" => "secretnumber#play"

  #====================================#
  #Rock Paper Scissors routes
  #====================================#
  get "/games/rockpaperscissors" => "rockpaperscissors#game"

  get "/games/rockpaperscissors/throw" => "rockpaperscissors#throw"


end
