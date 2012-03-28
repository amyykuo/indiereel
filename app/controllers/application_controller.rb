class ApplicationController < ActionController::Base
  protect_from_forgery
  
  # Custom route helper methods
  helper_method :role_route
  helper_method :portfolio_route
  helper_method :projects_route
  helper_method :home_route
  
  helper_method :current_user
  before_filter :authentication_required

  private

  def current_user
    @authenticated_user ||= User.find_by_uid(session[:user_id]) if session[:user_id]
  end

  def authentication_required
    if current_user.nil?
      redirect_to root_url
    end
  end
  
  # Custom route method definitions
  def role_route(role, action="show")
    route = "/#{role.user.identifier}/#{role.role_type}"
    route += "/#{action}" if action != "show"
    return route
  end
  
  def portfolio_route(role, action="show")
    route= "/#{role.user.identifier}/#{role.role_type}/portfolio"
    route += "/#{action}" if action != "show"
    return route
  end
  
  def projects_route(role, action="index")
    route= "/#{role.user.identifier}/#{role.role_type}/projects"
    route += "/#{action}" if action != "index"
    return route
  end
  
  def home_route(user)
    return "/#{user.identifier}"
  end




end
