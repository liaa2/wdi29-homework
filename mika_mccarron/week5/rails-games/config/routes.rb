Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

# 8 ball routs
get "/8ball" =>"ball#ask" #"/8ball is a rouer's name. "ball is folder name #in views folder and #ask reffers to ask.html.erb "
get "/8ball/answer" =>"ball#answer"


#secret number routs

get "/secret" =>"number#type"
get "/secret/result" => "number#result"
end
