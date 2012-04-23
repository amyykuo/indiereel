include Rack::Utils
require 'nokogiri'

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
	
	def self.test_soundcloud_scrape(uri)
	  Nokogiri::HTML(open(self.soundcloud_id)).css('.tracks-small .haudio.mode.player.small').first.attributes['data-sc-track']
	end
	
	private 
	
	def process_youtube_id
		self.youtube_id = parse_nested_query(self.youtube_id.split("?")[1])["v"] unless self.youtube_id.nil?
	end
	
	def process_soundcloud_id
	  unless self.soundcloud_id.nil?
	    page = Nokogiri::HTML(open(self.soundcloud_id))
	    page.css('.tracks-small .haudio.mode.player.small').first do |div|
	      div.attributes['data-sc-track']
	    end
	  end
	end
end
