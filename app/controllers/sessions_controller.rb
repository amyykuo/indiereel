class SessionsController < ApplicationController

  skip_before_filter :authentication_required

  def create
    auth = request.env["omniauth.auth"]
    user = User.find_by_uid(auth["uid"]) || User.create_with_omniauth(auth)
    user.update_with_omniauth(auth)
    session[:user_id] = user.uid
    redirect_to home_path(user.identifier)
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_url
  end
end
