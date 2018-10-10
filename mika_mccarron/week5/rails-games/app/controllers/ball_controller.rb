class BallController < ApplicationController

  def ask
  end

  def answer
    @question = params[:question]
    @answers = [
    'It is certain.',
    'It is decidedly so.',
    'Without a doubt.',
    'Google it!',
    'Yes - definitely.',
    ].sample
  end

end
