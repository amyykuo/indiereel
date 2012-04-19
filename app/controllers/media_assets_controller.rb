class MediaAssetsController < ApplicationController
	
	def show
	end
	
	def create
		media_asset = MediaAsset.create(params[:media_asset])
		flash[:error] = "There was an error in uploading your media." if media_asset.nil?
		flash[:notice] = "Media successfully uploaded." unless media_asset.nil?
		redirect_to mc_route(media_asset.media_collection)
	end
end
