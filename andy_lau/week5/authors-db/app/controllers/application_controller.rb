class ApplicationController < ActionController::Base

  # Before any action is performed, call the fetch_user method.
  before_action :fetch_user


  private
  def fetch_user
    # Check if the session[user_id] is set, and also if it stores a valid user ID, and if so, set an instance variable containing the user object
    if session[:user_id].present?
      @current_user = User.find_by id:session[:user_id]

      end
      # Make sure we actually found a valid user
      # If we didnt get a valid user in @current_user, then we clear the session key
      session[:users_id] = nil unless @current_user.present?
  end
end
