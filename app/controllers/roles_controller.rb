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
    role = Role.create(params[:role])
    
	if role.valid?
      role.media_collections << MediaCollection.create_default
      role.save
      redirect_to role_route(role)
    else
      # TODO add validation error messages
	  #flash[:error] = "Role creation failed for some reason. Oops!"
      redirect_to home_route(current_user)
    end
  end
  
  def edit
    @user = User.find_by_identifier(params[:identifier])
    @role = Role.find_by_role_type_and_user_id(params[:role], @user.id) rescue nil
    @ages = Role.ages
    @options = []
	
    for option in Role.options do
      @options << option unless Role.find_by_role_type_and_user_id(option, @user.id) != nil
    end
    
	if @role.nil?
      render 'public/404'
    end
  end
  
  def update
    @role = Role.find params[:id]
    @role.update_attributes!(params[:role])
    flash[:notice] = "#{@role.role_type} was successfully updated."
    redirect_to role_route(@role)
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
