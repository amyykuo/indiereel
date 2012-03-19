class Role < ActiveRecord::Base
  belongs_to :user
  
  def self.options
    ['actor', 'director', 'producer', 'writer']
  end
end
