class AddLocationToRole < ActiveRecord::Migration
  def change
    add_column :roles, :location, :string
  end
end
