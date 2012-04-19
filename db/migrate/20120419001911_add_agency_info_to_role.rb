class AddAgencyInfoToRole < ActiveRecord::Migration
  def change
    add_column :roles, :agency_name, :string
    add_column :roles, :agency_email, :string
    add_column :roles, :agency_phone_number, :string
  end
end
