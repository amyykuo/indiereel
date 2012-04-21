class AddDefaultValuesForRoles < ActiveRecord::Migration
  def change
    change_column :roles, :email, :string, {:default => ''}
    change_column :roles, :eyes, :string, {:default => ''}
    change_column :roles, :hair, :string, {:default => ''}
    change_column :roles, :height, :string, {:default => ''}
    change_column :roles, :weight, :string, {:default => ''}
    change_column :roles, :agency_name, :string, {:default => ''}
    change_column :roles, :agency_email, :string, {:default => ''}
    change_column :roles, :agency_phone_number, :string, {:default => ''}
    change_column :roles, :location, :string, {:default => ''}
    change_column :roles, :role_type_description, :string, {:default => ''}
    change_column :roles, :role_experience, :string, {:default => ''}
    change_column :roles, :age_range, :string, {:default => ''}
    change_column :roles, :role_skills, :string, {:default => ''}
  end
end
