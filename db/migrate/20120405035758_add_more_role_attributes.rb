class AddMoreRoleAttributes < ActiveRecord::Migration
  def change
    add_column :roles, :email, :string
    add_column :roles, :phone_number, :string
    add_column :roles, :role_type_description, :string
    add_column :roles, :role_experience, :string
    add_column :roles, :age_range, :string
    add_column :roles, :role_skills, :string
    add_column :roles, :attributes, :string
  end
end
