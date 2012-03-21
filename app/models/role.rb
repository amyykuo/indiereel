class RoleValidator < ActiveModel::Validator
  def validate(record)
    record.errors[:base] << "You cannot have more than one of any given role." unless Role.find_by_name_and_user_id(record.name, record.user.id).nil?
  end
end

class Role < ActiveRecord::Base
  belongs_to :user
  validates_with RoleValidator
  
  def self.options
    ['actor', 'director', 'producer', 'writer']
  end
end
