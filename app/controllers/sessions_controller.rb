class SessionsController < ApplicationController
  def new
    @title = "Log in"
  end

  def create
    if user = User.authenticate(params[:username], params[:password])
      session[:user_id] = user.id
      redirect_to root_path, :notice => "Logged in successfully"
    else
      redirect_to login_path,:notice => "Invalid username/password combination"
    end
  end

  def destroy
    sign_out
    reset_session
    redirect_to root_path, :notice => "You successfully logged out"
  end
end
