class SessionController < ApplicationController

  # 1. add the right action contents to these methods from Tunr
  # 2. add the form to the app/views/session/new.html.erb from Tunr
  # 3. add the right code to application_controller.rb from Tunr
  # 4. add the nav bar to app/views/layouts/application.html.erb from Tunr

  def new
  end

  def create
    user = User.find_by email: params[:email]

    if user.present? && user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to user_path(user.id)
    else
      flash[:error] = "Invalid email address or password"
      redirect to (login_path)
  end
end

  def destroy
    session[:user_id] = nil
    redirect_to login_path
  end
end
