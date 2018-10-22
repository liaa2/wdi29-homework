class SessionController < ApplicationController
  def new
  end

  def create
    #see if the email address actually corresponds to a user in the table
    user = User.find_by email: params[:email]

    if user.present? && user.authenticate( params[:password]) #if email exists and password good
      #successful login
      #get rails to create new session key to store the user's id.
      #this is the session key which we will use to check if the user is logged in on all future pages
      session[:user_id] = user.id

      redirect_to user_path(user.id)
    else
      #wrong credentials
      flash[:error] = "invalid email address or password"

      redirect_to (login_path)
    end

  end

  def destroy
    session[:user_id] = nil #this logs out the user
    redirect_to login_path
  end
end
