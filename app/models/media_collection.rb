class MediaCollection < ActiveRecord::Base
  belongs_to :role
  
  def self.create_default
    MediaCollection.create(:name => "QuickShow", :description => "Show off your best work in this album!", :quickshow => true)
  end
end
