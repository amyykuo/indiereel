class Role < ActiveRecord::Base
  belongs_to :user
  has_many :media_collections, :dependent => :destroy
  has_attached_file :profile_pic, :styles => {:profile => "180x180>"}
  
  validates :role_name, :presence => true
  validates :role_type, :presence => true
  
  #before_create :nil_to_empty
  
  
  def profile_pic_url
    self.profile_pic.file? ? self.profile_pic.url(:profile) : "default_role_pic.jpg"
  end
  
  def self.options
    ['talent', 'director', 'producer', 'crew']
  end
  
  def self.legacy_options
    ['Talent', 'Director', 'Producer', 'Crew', 'Actor']
  end
  
  def self.ages
    ['0-7', '8-15', '16-23', '24-31', '32-39', '40-47', '48-55', '55+']
  end
  
  #def nil_to_empty
  #  self.role_experience = "" if self.role_experience.nil?
  #  self.role_skills = "" if self.role_skills.nil?
  
end
