class RspController < ApplicationController
  def play

  end

  def play_game(play, computer)
    result =
    case
    when play == computer then "DRAW"
    when play == "scissors"
      computer == "rock" ? "YOU LOSE" : "YOU WIN"
    when play == "rock"
      computer == "paper" ? "YOU LOSE" : "YOU WIN"
    when play == "paper"
      computer == "scissors" ? "YOU LOSE" : "YOU WIN"
    end
  end

  def find_image(player)
    case
    when player == "rock" then "/assets/rock.png"
    when player == "scissors" then "/assets/scissors.png"
    when player == "paper" then "/assets/paper.png"
    end
  end

  def winner
    computer = ["rock", "scissors", "paper"].sample
    @throw = params[:throw].to_s

    @image_computer = find_image(computer)
    @image_human = find_image(@throw)


    @result = play_game(@throw, computer)

  end

end
