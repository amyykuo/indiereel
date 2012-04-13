class MediaCollectionsController < ApplicationController
  def show
    @user = User.find_by_identifier params[:identifier]
    @role = Role.find_by_role_type_and_user_id(params[:role], @user.id) rescue nil
    @album = MediaCollection.find_by_id(params[:media_collection]) rescue nil
    render_not_found if @role.nil? or @album.nil?
  end
  
  def new
    @user = User.find_by_identifier params[:identifier]
    @role = Role.find_by_role_type_and_user_id(params[:role], @user.id) rescue nil
  end
  
  def create
    #create a new media collection
    @user = User.find_by_identifier(current_user.identifier)
    @role_being_created = Role.find_by_role_type_and_user_id(params[:role], @user.id) rescue nil
    
	  if @role_being_created.nil?
	    role = Role.create params[:role]
	  end
  end
  
  def update
    #edit media collection
    @mc = MediaCollection.find params[:id]
    #@mc.update_attributes params[:mc]
    
    
    
  end
  
  def destroy
    #delete media collection
  end
end
