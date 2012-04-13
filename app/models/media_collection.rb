class MediaCollection < ActiveRecord::Base
  belongs_to :role
  
  def self.create_quickshow
    MediaCollection.create(:title => "QuickShow", :description => "Show off your best work in this album!")
  end
  
  def self.create_headshots #TODO FIX
    MediaCollection.create(:title => "QuickShow", :description => "Show off your best work in this album!")
  end
  
end
