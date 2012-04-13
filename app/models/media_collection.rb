class MediaCollection < ActiveRecord::Base
  belongs_to :role
  
  def self.create_quickshow
    MediaCollection.create(:title => "QuickShow", :description => "Show off your best work in this album!")
  end
  
  def self.create_headshot #TODO FIX
    MediaCollection.create(:title => "Headshots", :description => "Show off your head/or hottest looks!")
  end
  
end
