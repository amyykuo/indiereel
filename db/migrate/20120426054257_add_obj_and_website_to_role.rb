class AddObjAndWebsiteToRole < ActiveRecord::Migration
  def change
    add_column :roles, :objective, :string, {:default => ''}
    add_column :roles, :website, :string, {:default => ''}
  end
end
