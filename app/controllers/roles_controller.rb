class RolesController < ApplicationController
  
  def show
    @user = User.find_by_identifier(params[:identifier])
    @role = Role.find_by_role_type_and_user_id(params[:role], @user.id) rescue nil
    if @role.nil?
      render 'public/404'
    end
  end
  
  
  def new
    @user = User.find_by_identifier(params[:identifier])
    @options = Role.options
  end
  
  
  def create
    name = params[:role_type]
    if Role.options.include?(name)
      role = Role.create(:user => current_user, :role_type => name)
      if role.nil?
        redirect_to home_route(current_user)
      else
        redirect_to role_route(role)
      end
    else
      flash[:error] = "You cannot create that role type."
      redirect_to home_route(current_user)
    end
  end
  
  
  def edit
    @user = User.find_by_identifier(params[:identifier])
    @role = Role.find_by_role_type_and_user_id(params[:role], @user.id) rescue nil
    if @role.nil?
      render 'public/404'
    end
  end
  
  def destroy
    role = Role.find(params[:id])
    if current_user.identifier == role.user.identifier
      role.destroy
    else
      flash[:error] = "You cannot delete this role."
    end
    redirect_to home_route(current_user)
  end
end
