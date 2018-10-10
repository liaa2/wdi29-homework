class EightballController < ApplicationController

  def game
  end

  def get_answer
    ["I'm sorry but no!", "It is certain", "It is decidedly so", "Without a doubt", "Yes – definitely", "You may rely on it", "As I see it - yes", "Most Likely", "Outlook good", "All signs point to yes"].sample
  end

  def answer
    @question = params[:question]
    @question = @question + "?" if !@question.end_with? "?" 
    @answer = get_answer
  end

end
