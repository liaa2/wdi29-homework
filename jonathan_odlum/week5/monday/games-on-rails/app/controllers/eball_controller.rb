class EballController < ApplicationController

  def question

  end

  def respond
    @answers = ["I really couldn't say.",
                "Its beyond my knowledge.",
                "Maybe go ask Jeeves...",
                "¯\\_(ツ)_/¯",
                "I'm sorry, but I just don't know."]
    @question = params[ :question ]
  end

end
