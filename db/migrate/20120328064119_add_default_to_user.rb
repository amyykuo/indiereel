class AddDefaultToUser < ActiveRecord::Migration
  def change
    add_column :users, :default_role_id, :integer
  end
end
