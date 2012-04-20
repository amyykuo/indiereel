class RolesController < ApplicationController
  def show
    @user = User.find_by_identifier params[:identifier]
    @role = Role.find_by_role_type_and_user_id(params[:role], @user.id) rescue nil
    
    render_not_found if @role.nil?
  end
  
  def new
    @user = current_user
    @ages = Role.ages
    @options = User.remaining_role_options.map{|role| [role.capitalize, role]}
  end
  
  def create
    @user = current_user
    @role_being_created = Role.find_by_role_type_and_user_id(params[:role], @user.id) rescue nil
    
	  if @role_being_created.nil?
	    
	    role = Role.create params[:role]
      
	    if role.valid?
	      quickshow = MediaCollection.create_quickshow(role)
	      headshot = MediaCollection.create_headshot(role)
        role.quickshow_id = quickshow.id
        role.headshot_id = headshot.id
        role.media_collections << quickshow
        role.save
        @user.default_role_id = role.id if @user.roles.length <= 1
        flash[:notice] = "Role created."
        redirect_to role_route(role)
      else
        flash[:error] = "There are missing fields: stage name"
        redirect_to new_role_path
      end
    else
      flash[:error] = "There already was a role of that kind."
      redirect_to home_route(current_user)
    end
  end
  
  def edit
    @user = User.find_by_identifier params[:identifier]
    @role = Role.find_by_role_type_and_user_id(params[:role], @user.id) rescue nil
    @ages = Role.ages
    
    render_not_found if @user.nil? or @user.id != current_user.id or @role.nil?
  end
  
  def update
    @role = Role.find params[:id]
    @role.update_attributes params[:role]
    
    if @role.valid?
      flash[:notice] = "#{@role.role_type.capitalize} was successfully updated."
      redirect_to role_route(@role)
    else
      flash[:error] = "There were some errors in updating your role."
      redirect_to edit_role_route(@role)
    end
  end
  
  def destroy
    role = Role.find params[:id]
    
	  if current_user.identifier == role.user.identifier
      role.destroy
      flash[:notice] = "Role deleted."
    else
      flash[:error] = "You cannot delete this role."
    end
	  
    redirect_to home_route(current_user)
    
  end
end
