class NumberController < ApplicationController

  # def type
  # end


  def result
    @number = params[:number]
  end

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
