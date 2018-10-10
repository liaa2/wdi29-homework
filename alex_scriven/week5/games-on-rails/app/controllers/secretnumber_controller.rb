class SecretnumberController < ApplicationController

  def guess
  end
  def play
    @guess = params[:guess].to_i
    @answer = rand(1..10)
    @result_image = "sad_dog.jpg"
    if @guess == @answer then @result_image = "happy_dog.jpg"
    end

  end
end
