class UsersController < ApplicationController
  def show
    @user = User.find_by_identifier(params[:identifier])
    render_not_found and return if @user.nil?
    if current_user.uid == @user.uid
      @roles = @user.roles rescue nil
      @grouped_roles = @user.roles_in_groups_of(2)
    else
      if @user.default_role.nil?
        user = current user
        flash[:error] = "That user has no roles"
        redirect_to home_route(user)
      else
        default_role = @user.default_role
        redirect_to role_route(default_role)
      end
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
