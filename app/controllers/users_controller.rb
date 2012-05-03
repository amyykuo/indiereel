class UsersController < ApplicationController
  def show
    @user = User.find_by_identifier params[:identifier]
    render_not_found and return if @user.nil?
    
    @private_mode = current_user.uid == @user.uid
    
    if @private_mode
      @roles = @user.roles rescue nil
      @grouped_roles = @user.roles_in_groups_of 2
    elsif @user.default_role.nil?
      render_not_found
    else
      redirect_to role_route(@user.default_role)
    end
  end
 
  # Only used to update Default Role
  def update
    user = current_user
    new_default_role = Role.find_by_id_and_user_id(params[:role_id], user.id)
    
    if new_default_role.nil?
      flash[:error] = "There was an error in setting your default role."
    else
      user.default_role = new_default_role
      user.save
      flash[:notice] = "Default role successfully updated to #{new_default_role.role_type.capitalize}."
    end
    
    redirect_to home_route(user)
  end
end
