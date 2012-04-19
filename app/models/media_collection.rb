class MediaCollection < ActiveRecord::Base
  belongs_to :role
  has_many :media_assets
  
  validates :title, :presence => true
  
  def self.create_quickshow(role)
    MediaCollection.create(:title => "QuickShow", :description => "Show off your best work in this album!", :headshot => false, :quickshow => true, :role_id => role.id)
  end
  
  def self.create_headshot(role)
    MediaCollection.create(:title => "Headshots", :description => "Show off your head/or hottest looks!", :headshot => true, :quickshow => false, :role_id => role.id)
  end
  
end
