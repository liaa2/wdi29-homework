class SecretController < ApplicationController

  def guess

  end

  def result
    @button_pressed = params[:number]
    # puts "button #{@button_pressed}"

    @random = ["1","2","3","4"].sample
    # puts "random #{@random}"
    if @button_pressed == @random
      @winner = "You are a winner"
    else
      @winner = "You are a loser"
    end

  end

end
