class SecretNumberController < ApplicationController
  def secret
  end

  def result
    @guess = params[:guess].to_i
    @number = [1,2,3,4,5,6,7,8,9,10].sample

    @result =
      case
      when @number == @guess then "WINNER! #{@guess} was correct."
      else
        "WRONG. The number was #{@number}. Your guess was #{@guess}"
      end
  end
end
