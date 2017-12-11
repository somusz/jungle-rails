class SessionsController < ApplicationController
  def new
    session[:return_to] ||= request.referer
  end

  def create
    if user = User.authenticate_with_credentials(params_for_login)
      # Save the user id inside the browser cookie. This is how we keep the user
      # logged in when they navigate around our website.
      session[:user_id] = user.id
      redirect_to session[:return_to]
    else
    # If user's login doesn't work, send them back to the login form.
      errors.add(:email, message: "This email is not registered")
      redirect_to session[:return_to]
    end
  end

  def destroy
    session.clear
    redirect_to :back
  end

  private

  def params_for_login
    params.require(:session).permit(:email, :password)
  end

end
