class ApplicationController < ActionController::Base
  protect_from_forgery
  
  # Custom route helper methods
  helper_method :role_route
  helper_method :edit_role_route
  helper_method :portfolio_route
  helper_method :projects_route
  helper_method :mc_route
  helper_method :edit_mc_route
  helper_method :media_route
  helper_method :home_route
  
  
  helper_method :current_user
  before_filter :authentication_required
  
  def render_not_found
    render 'public/404', :status => 404
  end

  private

  def current_user
    @authenticated_user ||= User.find_by_uid(session[:user_id]) if session[:user_id]
  end

  def authentication_required
    if current_user.nil?
      redirect_to root_url
    end
  end
  
  # Route methods
  def role_route(role)
    custom_role_path(role.user.identifier, role.role_type)
  end
  
  def edit_role_route(role, anchor = nil)
    custom_edit_role_path(role.user.identifier, role.role_type, :anchor => anchor)
  end
  
  def portfolio_route(role)
    portfolio_path(role.user.identifier, role.role_type)
  end
  
  def projects_route(role)
    projects_path(role.user.identifier, role.role_type)
  end
  
  def mc_route(mc)
    custom_mc_path(mc.role.user.identifier, mc.role.role_type, mc.slug)
  end
  
  def edit_mc_route(mc)
    custom_edit_mc_path(mc.role.user.identifier, mc.role.role_type, mc.slug)
  end
  
  def media_route(media)
  	custom_media_path(media.media_collection.role.user.identifier, media.media_collection.role.role_type, media.media_collection.slug, media.id)
  end
  
  def home_route(user)
    home_path(user.identifier)
  end
  
end
