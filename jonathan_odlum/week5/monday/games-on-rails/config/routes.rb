Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  get "/eight_ball" => "eball#question"
  get "/eight_ball/respond" => "eball#respond"

  get "/secret_number" => "secret#guess"
  get "/secret_number/result" => "secret#compare"

  get "/spr" => "spr#throw"
  get "/spr/:thrown" => "spr#outcome"
  get "/spr/caught_out" =>"spr#run"

end
