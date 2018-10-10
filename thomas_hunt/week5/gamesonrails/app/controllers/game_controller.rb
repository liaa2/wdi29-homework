class GameController < ActionController::Base

  def home

  end

  def submitquestion

  answer = ["It is certain.","As I see it, yes","As I see it, yes", "Most likely"]
  @answer = answer.sample
  end

  def method_name

  end

end
