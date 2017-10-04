class SessionsController < ApplicationController
  def new
    if current_user
      user = User.find(session[:user_id])
      redirect_to user_path(user)
    end
  end

  def create
    user = User.find_by(email: params[:session][:email].downcase)
    @loginError = "";
    #check for a user with the same email id in the database
    if user && user.passwordMatches(params[:session][:password])
      session[:user_id] = user.id
      log_in user
      redirect_to user
    else
      @loginError = 'Invalid email/password'
      render 'new'
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to "/"
  end
end
