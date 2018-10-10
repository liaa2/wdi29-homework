Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

get "/game" => "game#home"

# get "/game/magic8ballgame" => "game#8ball"

get "/game/submitquestion" => "game#submitquestion"


get "/rsp" => "rsp#number"

get "/rsp/generated" => "rsp#generated"



end
