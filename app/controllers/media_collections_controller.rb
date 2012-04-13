class MediaCollectionsController < ApplicationController
  def create
    #create a new media collection
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
