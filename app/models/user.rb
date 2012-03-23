class User < ActiveRecord::Base

  has_many :roles, :dependent => :destroy

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
    self.save!
  end

  def identifier
    self.username || self.uid
  end

  def self.find_by_identifier(identifier)
    User.find_by_username(identifier) || User.find_by_uid(identifier)
  end
end
