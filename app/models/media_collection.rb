class MediaCollection < ActiveRecord::Base
  
  belongs_to :role
  has_many :media_assets, :dependent => :destroy
  
  validates :title, :presence => true
  
  before_save :set_slug
  
  def self.create_quickshow()
    MediaCollection.create(:title => "QuickShow", :description => "Show off your best work in this album!", :headshot => false, :quickshow => true)
  end
  
  def self.create_headshot()
    MediaCollection.create(:title => "Headshots", :description => "Show off your head/or hottest looks!", :headshot => true, :quickshow => false)
  end
  
  private
  
  def set_slug
  	self.slug = self.title.parameterize
  end
  
end
