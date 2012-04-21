class AddDefaultRoleUserIdToRoles < ActiveRecord::Migration
  def up
    add_column :roles, :default_role_user_id, :integer
    remove_column :users, :default_role_id
  end
  
  def down
    add_column :users, :default_role_id, :integer
    remove_column :roles, :default_role_user_id
  end
end
