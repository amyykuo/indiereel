class MediaCollection < ActiveRecord::Base
  belongs_to :role
  has_many :media_assets, :dependent => :destroy
  
  validates :title, :presence => true
  
  before_save :set_slug
  before_create :set_slug
  
  def self.create_quickshow(role)
    MediaCollection.create(:title => "QuickShow", :description => "Show off your best work in this album!", :headshot => false, :quickshow => true, :role_id => role.id)
  end
  
  def self.create_headshot(role)
    MediaCollection.create(:title => "Headshots", :description => "Show off your head/or hottest looks!", :headshot => true, :quickshow => false, :role_id => role.id)
  end
  
  private
  
  def set_slug
  	self.slug = self.title.parameterize
  end
  
end
