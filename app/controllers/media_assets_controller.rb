class MediaAssetsController < ApplicationController
	
	def show
		@media_asset = MediaAsset.find(params[:media_asset])
	end
	
	def create
		media_asset = MediaAsset.create(params[:media_asset])
		flash[:error] = "There was an error in uploading your media." if media_asset.nil?
		flash[:notice] = "Media successfully uploaded." unless media_asset.nil?
		redirect_to mc_route(media_asset.media_collection)
	end
	
	def destroy
    asset = MediaAsset.find(params[:media_asset])
    collection = asset.media_collection    

    asset.destroy
    flash[:notice] = "Photo deleted."

    redirect_to mc_route(collection)
    
  end
end
