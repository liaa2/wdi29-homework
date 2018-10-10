class RpsController < ApplicationController
  def rock_paper_scissors
  end

  def play
    @comp = ["rock", "paper", "scissors"].sample
    @move = params[:move]

    if @comp == @move
      @result = "Draw"
    elsif @comp == "rock" && @move == "paper"
      @result = "You Win"
    elsif @comp == "rock" && @move == "scissors"
      @result = "You Lose"
    elsif @comp == "scissors" && @move == "paper"
      @result = "You Lose"
    elsif @comp == "scissors" && @move == "rock"
      @result = "You Win"
    elsif @comp == "paper" && @move == "scissors"
      @result = "You Win"
    elsif @comp == "paper" && @move == "rock"
      @result = "You Lose"
    else
      @result = "Game Broked"
    end

  end
end
