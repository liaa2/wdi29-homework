# * Magic 8 ball takes user's questions from the the URL as params and returns a positive or negative answer.
# * You should make a route like ```/games/magic/:question``` which routes to ```magic#play``` (i.e. you will need a controller called ```magic_controller.rb```).

class MagicController < ApplicationController

  def home
  end

  def question
  end

  def answer
    replies = [
    "It is certain.",
    "It is decidedly so.",
    "Without a doubt.",
    "Yes - definitely.",
    "You may rely on it.",
    "As I see it, yes.",
    "Most likely.",
    "Outlook good.",
    "Yes.",
    "Signs point to yes.",
    "Reply hazy, try again",
    "Ask again later.",
    "Better not tell you now.",
    "Cannot predict now.",
    "Concentrate and ask again.",
    "Don't count on it.",
    "My reply is no.",
    "Computer says no.",
    "Outlook not so good.",
    "Very doubtful."
  ]
  question = params[:question]
  if question.end_with? "?"
    @answer = replies.sample
  else
    @answer = "Please ask an actual question"
  end

  end

end
