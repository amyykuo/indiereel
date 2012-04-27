class MediaAssetsController < ApplicationController
	
	def show
		@media_asset = MediaAsset.find(params[:media_asset])
	end
	
	def create
	  mc = MediaCollection.find(params[:media_asset][:media_collection_id])
		media_asset = MediaAsset.create(params[:media_asset])
		flash[:error] = "There was an error in uploading your media." if media_asset.nil?
		flash[:notice] = "Media successfully uploaded." unless media_asset.nil?
		redirect_to mc_route(mc)
	end
	
	def destroy
    asset = MediaAsset.find(params[:id])
    asset.destroy
    flash[:notice] = "Media deleted."
    redirect_to asset.previous.nil? ? mc_route(asset.media_collection) : media_route(asset.previous)
  end
end
