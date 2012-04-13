class RolesController < ApplicationController
  def show
    @user = User.find_by_identifier(params[:identifier])
    @role = Role.find_by_role_type_and_user_id(params[:role], @user.id) rescue nil
    render_not_found if @role.nil?
  end
  
  def new
    @user = User.find_by_identifier(current_user.identifier)
    @ages = Role.ages
    @options = []
    
	  for option in Role.options do
      @options << option unless Role.find_by_role_type_and_user_id(option, @user.id) != nil
    end
  end
  
  def create
    @user = User.find_by_identifier(current_user.identifier)
    @prev_role = Role.find_by_role_type_and_user_id(params[:role], @user.id) rescue nil
    
	  if @prev_role.nil?
	    role = Role.create(params[:role])
      role.media_collections << MediaCollection.create_default
      role.save
      flash[:notice] = "Role created."
      redirect_to role_route(role)
    else
      flash[:notice] = "There already was a role of that kind."
      redirect_to home_route(current_user)
    end
  end
  
  def edit
    @user = User.find_by_identifier(params[:identifier])
    @role = Role.find_by_role_type_and_user_id(params[:role], @user.id) rescue nil
    @ages = Role.ages
    
    render_not_found if @user.nil? or @user.id != current_user.id or @role.nil?
  end
  
  def update
    @role = Role.find params[:id]
    @role.update_attributes(params[:role])
    
    flash[:notice] = "#{@role.role_type} was successfully updated." if @role.valid?
    flash[:error] = "There were some errors in updating your role..." if @role.invalid?
    
    redirect_to role_route(@role)
  end
  
  def destroy
    role = Role.find(params[:id])
    
	  if current_user.identifier == role.user.identifier
      role.destroy
    else
      flash[:error] = "You cannot delete this role."
    end
	  
	  flash[:notice] = "Role deleted."
    redirect_to home_route(current_user)
  end
end
