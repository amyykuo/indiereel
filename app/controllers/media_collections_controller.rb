class MediaCollectionsController < ApplicationController
  
  def show
    @user = User.find_by_identifier params[:identifier]
    @role = Role.find_by_role_type_and_user_id(params[:role], @user.id) rescue nil
    @album = MediaCollection.find_by_slug_and_role_id(params[:media_collection], @role.id) rescue nil
    @media_asset = MediaAsset.new(:media_collection => @album) 
    render_not_found if @role.nil? or @album.nil?
    @grouped_media_assets = @album.media_assets_in_groups_of(6)
  end
  
  def index
    @user = User.find_by_identifier(params[:identifier])
    @role = Role.find_by_role_type_and_user_id(params[:role], @user.id) rescue nil
    render_not_found and return if @role.nil?
    @albums = @role.media_collections.sort_by{|album| [album.quickshow ? 1 : 0, album.headshot ? 1 : 0, album.updated_at]}.reverse
  end
  
  def new
    @role = Role.find_by_role_type_and_user_id(params[:role], current_user.id) rescue nil
    render_not_found and return if @role.nil?
    @mc = MediaCollection.new(:role => @role)
  end
  
  def create
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
    @mc = MediaCollection.find_by_slug_and_role_id(params[:media_collection], @role.id) rescue nil
  end
  
  def update
    @mc = MediaCollection.find(params[:id])
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
