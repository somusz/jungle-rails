class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def new
  end

  #creating new user; accepting any-case emails but storing them lowcase
  def create
    user = User.new(user_params)
    #valid users get saved into database
    if user.save
      session[:user_id] = user.id
      redirect_to root_path
    else
      #invalid users get redirected to registration page
      redirect_to new_users_path
    end
  end

  private

  #helper for registration
  def user_params
    params.require(:user).permit(:first_name, :last_name, :email, :password, :password_confirmation)
  end

end
