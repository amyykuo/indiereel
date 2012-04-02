class UsersController < ApplicationController
  def show
    @user = User.find_by_identifier(params[:identifier])
    @roles = @user.roles rescue nil
    
    render 'public/404' if @user.nil?
  end
  
  # This is for the default role portion of the view, to be implemented later.
  def update
    user = User.find_by_identifier(params[:identifier])
    user.default_role = Role.find_by_user_id_and_role_type(@user.id, params[:role_type]) unless params[:role_type].nil?
    user.save 
    redirect_to home_route(@user)
  end
end
