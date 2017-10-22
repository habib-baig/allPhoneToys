class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  include SessionsHelper
  helper_method :current_user
  helper_method :current_admin

  def require_user
    redirect_to '/login' unless current_user
  end
end
