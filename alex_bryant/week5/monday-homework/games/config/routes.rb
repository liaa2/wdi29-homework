Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root to: "games#index"

  get "/games" => "games#index"
  get "/eightball" => "eightball#game"
  get "/eightball/result" => "eightball#answer"
  get "/secret_number" => "secret#guess"
  get "/secret_number/:guess" => "secret#answer"
  get "/rps" => "rps#game"
  get "/rps/result" => "rps#result"

end
