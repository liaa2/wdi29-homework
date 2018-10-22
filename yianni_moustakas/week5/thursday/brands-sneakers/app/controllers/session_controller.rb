class SessionController < ApplicationController
  def new
  end

  def create
    # see if the email address entered actually corresponds to a user in the table
    user = User.find_by email: params[:email]
    if user.present? && user.authenticate( params[:password] )
      # Succesful login
      # get rails to create a new session variable to stroe the user's ID;
      # this is the session key which we will use to check if the user is logged on on all future pages
      session[:user_id] = user.id
      redirect_to users_path(user.id)
    else
      # Bad credential, i.e. unsuccessful login
      flash[:error] = "Invalid email address or password"
      redirect_to( login_path )
    end

  end

  def destroy
    session[:user_id] = nil # this logs out the users
    redirect_to login_path
  end
end
