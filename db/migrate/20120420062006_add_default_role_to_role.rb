class AddDefaultRoleToRole < ActiveRecord::Migration
  def change
    add_column :roles, :default_role, :boolean, :default => false
  end
end
