class Role < ActiveRecord::Base
  belongs_to :user
  belongs_to :default_role_user, :class_name => "User", :foreign_key => "default_role_user_id"
  has_many :media_collections, :dependent => :destroy
  has_attached_file :profile_pic, 
                    :styles => {:profile => "180x180#", :thumb => "100x100#"},
                    :storage => :s3,
	                  :s3_credentials => "#{Rails.root}/config/s3.yml",
	                  :path => "/:style/:id/:filename"
  
  validates :role_name, :presence => true
  validates :role_type, :presence => true
  
  before_create :check_for_default_role
  after_destroy :transfer_default_role
  
  searchable do
    text :role_name
    text :role_type
    text :role_type_description
    text :role_experience
    text :objective
    
    string :email
    string :website
    text :location
    text :agency_name
    string :agency_email
  end
  
  def self.options
    ['talent', 'director', 'producer', 'crew']
  end
  
  def self.legacy_options
    ['Talent', 'Director', 'Producer', 'Actor', 'Crew']
  end
  
  def self.ages
    ['0-7', '8-15', '16-23', '24-31', '32-39', '40-47', '48-55', '55+']
  end
  
  def self.physical_attributes
    {:age_range => 'Age Range', :eyes => 'Eyes', :hair => 'Hair', :height => 'Height', :weight => 'Weight'}
  end
  
  def self.contact_attributes
    {:email => 'Email', :phone_number => 'Phone', :website => 'Website'}
  end
  
  def self.living_attributes
    {:location => 'Location'}
  end
  
  def self.agency_attributes
    {:agency_name => 'Agency Name', :agency_email => 'Agency Email', :agency_phone_number => 'Agency Phone'}
  end
  
  def self.role_attributes
    {:physical => [:age_range, :eyes, :hair, :height, :weight],
    :contact => [:email, :phone_number, :website], 
    :living => [:location],
    :agency => [:agency_name, :agency_email, :agency_phone_number]}
  end
  
  
  # Attribute Wrappers
  
  def portfolio_album
    # Remove those that are empty or headshots, then sort by quickshow and update_at and return the first one
    self.media_collections.find_all{|album| (not album.headshot) and (not album.media_assets.empty?)}.sort_by{|album| [album.quickshow ? 1 : 0, album.updated_at]}.reverse.first
  end
  
  def profile_pic_url
    self.profile_pic.file? ? self.profile_pic.url(:profile) : "default_role_pic.jpg"
  end
  
  def headshots
    MediaCollection.find_by_role_id_and_headshot(self.id, true)
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
end
