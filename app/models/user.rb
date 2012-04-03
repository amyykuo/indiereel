class User < ActiveRecord::Base

  has_many :roles, :dependent => :destroy
  has_one :default_role, :class_name => "Role", :foreign_key => "default_role_id"

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
      user.identifier = auth["info"]["nickname"] || auth["uid"]
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
    self.identifier = auth["info"]["nickname"] || auth["uid"]
    self.save!
  end
end
