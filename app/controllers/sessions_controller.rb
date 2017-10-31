class SessionsController < ApplicationController
  def new
    if current_user
      user = User.find(session[:user_id])
      redirect_to user_path(user)
    elsif current_admin
      redirect_to adminDashboard_path
    end
  end

  def create
    @loginError = "";

    admin = Admin.find_by(email: params[:session][:email].downcase)
    user = User.find_by(email: params[:session][:email].downcase)


    if admin && admin.passwordMatches(params[:session][:password])
      log_in_admin admin
      redirect_to adminDashboard_path
    elsif user && user.passwordMatches(params[:session][:password])   #check for a user with the same email id in the database
      log_in_user user
      redirect_to user
    else
      @loginError = 'Invalid email/password'
      render 'new'
    end
  end

  def destroy
    session[:user_id] = nil
    session[:admin_id] = nil
    redirect_to "/"
  end
end
