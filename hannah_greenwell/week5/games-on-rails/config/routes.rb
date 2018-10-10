Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  get "/magic/ask" => "magic#ask"
  get "/magic/answer" => "magic#answer"

  get "/secret_number/guess" => "secret_number#guess"
  get "/secret_number/check" => "secret_number#check"

  get "/rock_paper_scissors/throw" => "rock_paper_scissors#throw"
  get "/rock_paper_scissors/check" => "rock_paper_scissors#check"

end
