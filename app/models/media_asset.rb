class MediaAsset < ActiveRecord::Base
	belongs_to :media_collection
	has_attached_file :media, :styles => {:normal => "300x300>", :thumb => "128x128#"}
end
