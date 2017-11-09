class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  include SessionsHelper
  helper_method :current_user
  helper_method :current_admin
  before_action :set_variables

  def require_user
    redirect_to '/login' unless current_user
  end

  def set_variables
    @providers = Provider.find_by_sql("SELECT * FROM providers")
    @locations = Location.find_by_sql("SELECT * FROM locations")
  end
end
