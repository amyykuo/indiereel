class IndexController < ApplicationController

  skip_before_filter :authentication_required, :only => [:welcome]

  def index
    render 'layouts/index'
  end

  def welcome
  end

end
