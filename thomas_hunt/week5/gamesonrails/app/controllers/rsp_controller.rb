class RspController < ActionController::Base

def numbers

end

def generated
@button_pressed=params[:number]
@num = [1,2,3,4,5,6,7,8,9,10].sample

if @button_pressed == @num
  @winner = "you won!"
else
  @winner = "you lose!"

end








end
end
