class User < ActiveRecord::Base

  has_many :roles, :dependent => :destroy
  has_one :default_role, :class_name => "Role", :foreign_key => "default_role_user_id"
  
  validates :name, :presence => true, :length => { :maximum => 50 }
  validates :uid, :uniqueness => true
  validates :username, :uniqueness => true
  
  searchable do
    string :username
    string :email
    string :gender
  end
  
  def role_list
    self.roles.map{|role| role.role_type }
  end
  
  def remaining_role_options
    Role.options.delete_if{|role| self.role_list.include?(role)}
  end
  
  def roles_in_groups_of(size)
    self.roles.each_slice(size).to_a
  end

  def self.create_with_omniauth(auth)
    create do |user|
      user.uid = auth["uid"]
      user.provider = "facebook"
      user.username = auth["info"]["nickname"] rescue nil
      user.name = auth["info"]["name"]
      user.first_name = auth["info"]["first_name"]
      user.last_name = auth["info"]["last_name"]
      user.timezone = auth["extra"]["raw_info"]["timezone"]
      user.access_token = auth["credentials"]["token"] rescue nil
      user.email = auth["info"]["email"]
      user.gender = auth["extra"]["raw_info"]["gender"]
      user.image = auth["info"]["image"] rescue nil
      unless !auth["info"]["nickname"].gsub(/[^.]/, "").empty?
        user.identifier = auth["info"]["nickname"] || auth["uid"]
      else
        user.identifier = auth["uid"]
      end
    end
  end
  
  def self.create_with_omniauth_test_mode(auth)
    create do |user|
      user.uid = auth[:uid]
      user.provider = auth[:provider]
      user.username = auth[:nickname] rescue nil
      user.name = auth[:name]
      user.access_token = auth[:token] rescue nil
      user.identifier = auth[:nickname] || auth[:uid]
    end
  end

  def update_with_omniauth(auth)
    self.username = auth["info"]["nickname"] rescue nil
    self.name = auth["info"]["name"]
    self.first_name = auth["info"]["first_name"]
    self.last_name = auth["info"]["last_name"]
    self.timezone = auth["extra"]["raw_info"]["timezone"]
    self.access_token = auth["credentials"]["token"] rescue nil
    self.email = auth["info"]["email"]
    self.gender = auth["extra"]["raw_info"]["gender"]
    self.image = auth["info"]["image"] rescue nil
    #self.identifier = auth["info"]["nickname"] || auth["uid"]
    unless !auth["info"]["nickname"].gsub(/[^.]/, "").empty?
      self.identifier = auth["info"]["nickname"] || auth["uid"]
    else
      self.identifier = auth["uid"]
    end
    self.save!
  end
end
