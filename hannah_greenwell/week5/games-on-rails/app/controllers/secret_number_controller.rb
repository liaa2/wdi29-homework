
class SecretNumberController < ApplicationController

  def guess
  end

  def check
    @magic_number = Random.rand(0..10)
    guess = params[:guessed_number].to_i


    if guess == @magic_number
      @result = "You're the best! You guessed correctly! Woooo!"
    else
      @result = "You suck! You guessed incorrectly... boooo!"
    end

  end

end
