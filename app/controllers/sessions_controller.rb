class SessionsController < ApplicationController
  #users get redirected to the page from which they navigated to the login page
  def new
    session[:return_to] ||= request.referer
  end

  #users are authenticated via a user helper method
  def create
    if user = User.authenticate_with_credentials(params_for_login)
      # a session cookie is assigned to logged users
      session[:user_id] = user.id
      redirect_to session[:return_to]
    else
      redirect_to session[:return_to], flash: { error: "Invalid email address" }
    end
  end

  #session gets cleared upon logout
  def destroy
    session.clear
    redirect_to :back
  end

  private

  #helper for login
  def params_for_login
    params.require(:session).permit(:email, :password)
  end

end
