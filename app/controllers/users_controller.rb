class UsersController < ApplicationController
  def show
    @user = User.find_by_identifier(params[:identifier])
    if current_user.uid == @user.uid
      @roles = @user.roles rescue nil
      @grouped_roles = @user.roles_in_groups_of(2)
      render_not_found if @user.nil?
    else
      default_role = Role.find_by_id(@user.default_role_id)
      @role = Role.find_by_role_type_and_user_id(default_role.role_type, @user.id) rescue nil
      render_not_found if @user.nil?
      redirect_to role_route(default_role)
    end
  end
 
  # This is for the default role portion of the view, to be implemented later.
  def update
    user = User.find_by_identifier(params[:identifier])
    user.default_role = Role.find_by_user_id_and_role_type(@user.id, params[:role_type]) unless params[:role_type].nil?
    user.save 
    redirect_to home_route(@user)
  end

end
