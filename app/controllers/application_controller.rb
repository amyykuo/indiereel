class ApplicationController < ActionController::Base
  protect_from_forgery

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




end
