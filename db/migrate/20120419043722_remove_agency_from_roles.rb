class RemoveAgencyFromRoles < ActiveRecord::Migration
  def up
    remove_column :roles, :agency
  end

  def down
    add_column :roles, :agency, :string
  end
end
