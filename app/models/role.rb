class Role < ActiveRecord::Base
  belongs_to :user
  belongs_to :default_role_user, :class_name => "User", :foreign_key => "default_role_user_id"
  has_many :media_collections, :dependent => :destroy
  has_attached_file :profile_pic, :styles => {:profile => "180x180>"}
  
  validates :role_name, :presence => true
  validates :role_type, :presence => true
  
  before_create :check_for_default_role
  after_destroy :transfer_default_role
  
  def self.options
    ['talent', 'director', 'producer', 'crew']
  end
  
  def self.legacy_options
    ['Talent', 'Director', 'Producer', 'Crew', 'Actor']
  end
  
  def self.ages
    ['0-7', '8-15', '16-23', '24-31', '32-39', '40-47', '48-55', '55+']
  end
  
  
  # Attribute Wrappers
  
  def profile_pic_url
    self.profile_pic.file? ? self.profile_pic.url(:profile) : "default_role_pic.jpg"
  end
  
  private 
  
  def check_for_default_role
    self.default_role_user = self.user if self.user.roles.empty?
  end
  
  def transfer_default_role
    user = self.user
    new_role = Role.find_all_by_user_id(user.id).first
    if (not self.default_role_user.nil?) and (not new_role.nil?)
      user.default_role = new_role
      user.save
    end
  end
  
  #def nil_to_empty
  #  self.role_experience = "" if self.role_experience.nil?
  #  self.role_skills = "" if self.role_skills.nil?
  
end
