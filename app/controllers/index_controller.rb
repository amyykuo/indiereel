class IndexController < ApplicationController

  skip_before_filter :authentication_required

  def index
      redirect_to home_route(current_user) unless current_user.nil?
  end

  def welcome
  end

end
