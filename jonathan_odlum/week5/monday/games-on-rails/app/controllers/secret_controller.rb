class SecretController < ApplicationController

  def guess

  end

  def compare
    guess = params[ :guess ].to_i
    if guess > 10 || guess < 1
      @output = "...really?"
    else
      number = Random.rand(1..10)
      if guess == number
        @output = "You guessed it!"
      else
        @output = "So close!"
      end
    end
  end

end
