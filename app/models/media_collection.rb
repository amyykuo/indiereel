class MediaCollection < ActiveRecord::Base
  belongs_to :role
  
  def self.create_default
    MediaCollection.create(:title => "QuickShow", :description => "Show off your best work in this album!")
  end
end
