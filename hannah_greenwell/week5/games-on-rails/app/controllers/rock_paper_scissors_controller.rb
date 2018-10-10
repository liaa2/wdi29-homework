
class RockPaperScissorsController < ApplicationController

  def throw
  end

  def check
    @users_move = params[:move]
    @computers_move = ['Rock', 'Paper', 'Scissors'].sample

    if @users_move == @computers_move
      @result = "Yay!!! You win! Good work champ!"
    else
      @result = "Computer wins! You suck!"
    end
  end

end
