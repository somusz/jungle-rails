class SessionsController < ApplicationController
  def new
    session[:return_to] ||= request.referer
  end

  def create
    user = User.find_by_email(params[:session][:email])
    # If the user exists AND the password entered is correct.
    if user && user.authenticate(params[:session][:password])

      # Save the user id inside the browser cookie. This is how we keep the user
      # logged in when they navigate around our website.
      session[:user_id] = user.id
      redirect_to session[:return_to]
    else
    # If user's login doesn't work, send them back to the login form.
      redirect_to :back
    end
  end

  def destroy
    session.clear
    redirect_to :back
  end
end
