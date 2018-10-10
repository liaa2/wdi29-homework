class SecretController < ApplicationController

  def guess

  end

  def random_number
    arr = %w{1 2 3 4 5 6 7 8 9 10}
    arr.sample
  end

  def answer
    @answer = params[:number]
    @random = random_number
  end

end
