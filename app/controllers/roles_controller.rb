class RolesController < ApplicationController
  def show
    @user = User.find_by_identifier(params[:identifier])
    @role = params[:role]
  end

  def new
    render :nothing => true
  end
end
