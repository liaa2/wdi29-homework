class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    user =User.create user_params

    if user.persisted?  #did the user get saved/created?
      session[:user_id]=user.id #log in the new user
      redirect_to user_path(user.id) #go to show page for this user
    else
      #account not created, show error
      flash[:errors] = user.errors.full_messages  #set  a flash key to show on the next page: it will be an array of error strings
      redirect_to new_user_path  #create new user page
    end
  end

  def show
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end
end
