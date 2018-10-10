class RockpaperscissorsController < ApplicationController

  def game
  end

  def throw
    throws = ["scissors", "paper", "rock"]
    @computer_throw = throws.sample()
    @human_throw = params[:throw]
    game_result = throws.index(@human_throw).to_s +  throws.index(@computer_throw).to_s

    human_wins = ["01", "12","31"]

    if human_wins.index(game_result) == nil
      @throw_result_image = "lose.gif"
      @result = "YOU LOSE!"
    else
      @throw_result_image = "win.jpg"
      @result = "YOU WIN!"
    end

    if @computer_throw == @human_throw
      @throw_result_image = "tie.jpg"
      @result = "Tie"
    end


  end

end
