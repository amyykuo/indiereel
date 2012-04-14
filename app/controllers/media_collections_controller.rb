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
    #@album = MediaCollection.find_by_id(params[:mc])
    @role = Role.find_by_id(params[:mc][:role_id])
    @mc = MediaCollection.create(params[:mc])
	  if @mc.valid?
	    flash[:notice] = "Album created."
      redirect_to mc_route(@mc)
	  else
	    flash[:error] = "Album needs a title"
	    redirect_to custom_new_mc_path(@role.user.identifier, @role.role_type)
    end
  end
  
  def edit
    @user = User.find_by_identifier params[:identifier]
    @role = Role.find_by_role_type_and_user_id(params[:role], @user.id) rescue nil
    @album = MediaCollection.find_by_id(params[:media_collection]) rescue nil
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
