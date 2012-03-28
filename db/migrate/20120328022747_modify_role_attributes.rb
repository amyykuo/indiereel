class ModifyRoleAttributes < ActiveRecord::Migration
  def change
    add_column :roles, :role_name, :string
    rename_column :roles, :name, :role_type
    add_column :roles, :profile_pic, :string
  end
end
