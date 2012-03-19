class ApplicationController < ActionController::Base
  protect_from_forgery
  
  # Custom route helper methods
  helper_method :role_route
  
  helper_method :current_user
  before_filter :authentication_required

  private

  def current_user
    @authenticated_user ||= User.find_by_uid(session[:user_id]) if session[:user_id]
  end

  def authentication_required
    if current_user.nil?
      redirect_to "/welcome"
    end
  end
  
  # Custom route method definitions
  def role_route(role, action="show")
    route = "/#{role.user.identifier}/#{role.name}"
    route += "/#{action}" if action != "show"
    return route
  end




end
