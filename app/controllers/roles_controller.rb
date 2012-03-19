class RolesController < ApplicationController
  def show
    @user = User.find_by_identifier(params[:identifier])
    @role = Role.find_by_name_and_user_id(params[:role], @user.id)
    if @role.nil?
      render 'public/404'
    end
  end

  def new
    @user = User.find_by_identifier(params[:identifier])
  end
  
  def create
    name = params[:name]
    Role.create!(:user => current_user, :name => name)
    redirect_to "/#{current_user.identifier}/#{name}"
  end
end
