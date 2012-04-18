class AddMoreAttributesToRole < ActiveRecord::Migration
  def change
    add_column :roles, :agency, :string
    add_column :roles, :eyes, :string
    add_column :roles, :hair, :string
    add_column :roles, :height, :string
    add_column :roles, :weight, :string
  end
end
