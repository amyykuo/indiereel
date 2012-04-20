class RemoveProfilePicFromRoles < ActiveRecord::Migration
  def up
    remove_column :roles, :profile_pic
  end

  def down
    add_column :roles, :profile_pic, :string, :default => "default_role_pic.jpg"
  end
end
