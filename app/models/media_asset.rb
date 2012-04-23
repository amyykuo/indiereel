include Rack::Utils

class MediaAsset < ActiveRecord::Base
	belongs_to :media_collection
	has_attached_file :media, :styles => {:normal => "300x300>", :thumb => "128x128#", :preview => "900x450>"}
	
	before_create :process_youtube_id
	
	def image?
		not self.media_file_name.nil?
	end
	
	def video?
		not self.youtube_id.nil?
	end
	
	private 
	
	def process_youtube_id
		self.youtube_id = parse_nested_query(self.youtube_id.split("?")[1])["v"] unless self.youtube_id.nil?
	end
end
