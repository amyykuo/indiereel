class RolesController < ApplicationController
  
  def show
    @user = User.find_by_identifier(params[:identifier])
    @role = Role.find_by_role_type_and_user_id(params[:role], @user.id) rescue nil
    render_not_found if @role.nil?
  end
  
  
  def new

    @user = User.find_by_identifier(current_user.identifier)

    @options = []

    

    
    for option in Role.options do
      @options << option unless Role.find_by_role_type_and_user_id(option, @user.id) != nil
    end
    
    
    render_not_found if @user.nil?
  end
  
  
  def create
    name = params[:role_type]
    if Role.options.include?(name)
      role = Role.create(:user => current_user, :role_type => name)
      redirect_to (role.valid? ? role_route(role) : home_route(current_user))
    else
      flash[:error] = "You cannot create that role type."
      redirect_to home_route(current_user)
    end
  end
  
  
  def edit
    @user = User.find_by_identifier(params[:identifier])
    @role = Role.find_by_role_type_and_user_id(params[:role], @user.id) rescue nil
    @ages = Role.ages
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
