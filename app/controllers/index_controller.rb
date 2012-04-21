class IndexController < ApplicationController

  skip_before_filter :authentication_required 
  layout :determine_layout

  def index
      redirect_to home_route(current_user) unless current_user.nil?
  end

  def welcome
  end
  
  def about
  end
  
  def contact
  end
  
  def meet
  end
  
  def help
  end
  
  private
  
  def determine_layout
    current_user ? "application" : "index"
  end

end
