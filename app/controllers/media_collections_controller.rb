class MediaCollectionsController < ApplicationController
  
  def show
    @user = User.find_by_identifier params[:identifier]
    @role = Role.find_by_role_type_and_user_id(params[:role], @user.id) rescue nil
    @album = MediaCollection.find_by_id(params[:media_collection]) rescue nil
    render_not_found if @role.nil? or @album.nil?
  end
  
  def index
    @user = User.find_by_identifier(params[:identifier])
    @role = Role.find_by_role_type_and_user_id(params[:role], @user.id) rescue nil
    render_not_found if @role.nil?
  end
  
  def new
    @user = current_user
    @role = Role.find_by_role_type_and_user_id(params[:role], @user.id) rescue nil
    @mc = MediaCollection.new(:role => @role)
  end
  
  def create
    #create a new media collection
    #@album = MediaCollection.find_by_id(params[:mc])
    @role = Role.find_by_id(params[:media_collection][:role_id])
    @mc = MediaCollection.create(params[:media_collection])
	  if @mc.valid?
	    flash[:notice] = "Album created."
      redirect_to mc_route(@mc)
	  else
	    flash[:error] = "Album needs a title"
	    redirect_to new_media_collection_path(:role => @role.role_type)
    end
  end
  
  def edit
    @user = current_user
    @role = Role.find_by_role_type_and_user_id(params[:role], @user.id) rescue nil
    @mc = MediaCollection.find_by_id(params[:media_collection]) rescue nil
  end
  
  def update
    @mc = MediaCollection.find_by_id(params[:id])
    @mc.update_attributes(params[:media_collection])
    if @mc.valid?
      flash[:notice] = "#{@mc.title} album was successfully updated."
      redirect_to mc_route(@mc)
    else
      flash[:error] = "You've got to give your album a name!"
      redirect_to mc_route(@mc, "edit")
    end
  end
  
  def destroy
    #delete media collection
  end
end
