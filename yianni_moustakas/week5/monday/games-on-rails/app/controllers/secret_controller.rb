# __Secret Number__
#
# * Users click a number between 1 and 10. The controller validates the guess and renders the win or lose view.
# * You should make a route like ```/games/secret/:guess``` which routes to ```secret#play``` -->

class SecretController < ApplicationController
  def secret_number
  end
  def guess
    @secret_num = Random.rand(1..10)
    @guess = params[:number].to_i


    if @secret_num == @guess
      @result = "You got it!"
      puts @guess
    else
      @result = "Sorry try again"
      puts @guess
    end
  end
end
