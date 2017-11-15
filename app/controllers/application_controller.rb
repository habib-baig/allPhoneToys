class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  include SessionsHelper
  helper_method :current_user
  helper_method :current_admin
  before_action :set_variables
  
  def current_user
  @current_user ||= User.find_by_auth_token!(cookies[:auth_token]) if cookies[:auth_token]
  end

  def require_user
    redirect_to '/login' unless current_user
  end

  def require_admin
    redirect_to '/login' unless current_admin
  end

  def set_variables
    @loggedin_user = User.new
    if current_user
      @loggedin_user = current_user
    end
    @providers = Provider.find_by_sql("SELECT * FROM providers")
    @locations = Location.find_by_sql("SELECT * FROM locations")
  end
end
