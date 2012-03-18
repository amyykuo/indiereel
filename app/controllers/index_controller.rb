class IndexController < ApplicationController

  skip_before_filter :authentication_required, :only => [:welcome]

  def index
    redirect_to home_path
  end

  def welcome
  end

end
