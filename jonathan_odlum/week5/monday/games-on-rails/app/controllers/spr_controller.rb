class SprController < ApplicationController

  def throw

  end

  def outcome
    @thrown = params[ :thrown ]
    if @thrown == 'paper'
      @comp = 'scissors'
    elsif @thrown == 'scissors'
      @comp = 'rock'
    else
      @comp = 'paper'
    end
  end

  def run

  end

end
