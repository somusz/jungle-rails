class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by_email(params[:session][:email])
    # If the user exists AND the password entered is correct.
    # byebug
    p user
    if user && user.authenticate(params[:session][:password])
      p "LOGGED IN"
      # Save the user id inside the browser cookie. This is how we keep the user
      # logged in when they navigate around our website.
      session[:user_id] = user.id
      redirect_to root_path
    else
    # If user's login doesn't work, send them back to the login form.
      p "FAILED LOG IN"
      redirect_to root_path
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_path
  end
end
