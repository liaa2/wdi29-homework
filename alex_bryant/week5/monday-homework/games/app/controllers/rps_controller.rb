class RpsController < ApplicationController

  def game

  end

  def random_result
    arr = %w{rock paper scissors}
    arr.sample
  end

  def result
    @throw = params[:throw]
    @other_player = random_result
    @result = "You win!"
    if @throw == @other_player
      @result = "Draw"
    else
      if @throw == "scissors" && @other_player == "rock" || @throw == "rock" && @other_player == "paper" || @throw == "paper" && @other_player == "scissors"
        @result = "You Lose..."
      end
    end
  end

end
