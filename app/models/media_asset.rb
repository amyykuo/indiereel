include Rack::Utils

require 'nokogiri'
require 'httparty'
require 'uri'

# Helper class to scrape Soundcloud
class SoundCloud
  include HTTParty
  def get_id(uri)
    doc = self.class.get(uri)
    Nokogiri::HTML(doc).css('.hidden.download-options.action-overlay').first.attributes['data-sc-track'].value
  end
end

class MediaAsset < ActiveRecord::Base
	belongs_to :media_collection
	has_one :next, :class_name => "MediaAsset", :foreign_key => "previous_id"
	belongs_to :previous, :class_name => "MediaAsset", :foreign_key => "previous_id"
	has_attached_file :media, 
	                  :styles => {:normal => "300x300>", :thumb => "128x128#", :preview => "900x450>"},
	                  :storage => :s3,
	                  :s3_credentials => "#{Rails.root}/config/s3.yml",
	                  :path => "/:style/:id/:filename"
	
	before_create :process_youtube_id
	before_create :process_soundcloud_id
	after_create :append_to_list
	after_destroy :remove_from_list
	
	def image?
		not self.media_file_name.nil?
	end
	
	def video?
		not self.youtube_id.nil?
	end
	
	def audio?
	  not self.soundcloud_id.nil?
	end
	
	def soundcloud_embed_uri
	  inner_url = URI.escape("http://api.soundcloud.com/tracks/#{self.soundcloud_id}")
	  "http://w.soundcloud.com/player/?url=#{inner_url}&show_artwork=true"
	end
	
	def self.test_soundcloud(uri)
	  SoundCloud.new.get_id(uri)
	end
	
	private 
	
	def process_youtube_id
		self.youtube_id = parse_nested_query(self.youtube_id.split("?")[1])["v"] unless self.youtube_id.nil?
	end
	
	def process_soundcloud_id
	  self.soundcloud_id = SoundCloud.new.get_id(self.soundcloud_id) unless self.soundcloud_id.empty?
	end
	
	def append_to_list
	  unless self.media_collection.media_assets.length <= 1
	    self.previous = self.media_collection.media_assets[-2]
	    self.save
	  end
  end
  
  def remove_from_list
    unless self.previous.nil?
      self.previous.next = self.next
      self.previous.save
    end
  end
end
