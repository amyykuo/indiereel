class Role < ActiveRecord::Base
  belongs_to :user
  has_many :media_collections, :dependent => :destroy
  
  # TODO - validation
  validates :role_name, :presence => true
  validates :role_type, :presence => true
  
  def self.options
    ['talent', 'director', 'producer', 'crew']
  end
  
  def self.legacy_options
    ['Talent', 'Director', 'Producer', 'Crew', 'Actor']
  end
  
  def self.ages
    ['0-7', '8-15', '16-23', '24-31', '32-39', '40-47', '48-55', '55+']
  end
  
end
