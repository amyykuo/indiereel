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
    @options = Role.options
  end
  
  def create
    name = params[:name]
    if Role.options.include?(name)
      Role.create!(:user => current_user, :name => name)
      redirect_to "/#{current_user.identifier}/#{name}"
    else
      flash[:error] = "You cannot create that role type."
      redirect_to "/#{current_user.identifier}"
  end
end
