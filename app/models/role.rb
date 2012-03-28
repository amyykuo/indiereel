class RoleValidator < ActiveModel::Validator
  def validate(record)
    record.errors[:base] << "You cannot have more than one of any given role." unless Role.find_by_role_type_and_user_id(record.role_type, record.user.id).nil?
  end
end

class Role < ActiveRecord::Base
  belongs_to :user
  validates_with RoleValidator
  
  
  def self.options
    ['Talent', 'Director', 'Producer', 'Crew']
  end
  
  
end
