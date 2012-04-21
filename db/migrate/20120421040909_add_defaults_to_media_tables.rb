class AddDefaultsToMediaTables < ActiveRecord::Migration
  def change
    change_column :media_assets, :description, :string, {:default => ''}
    
    change_column :media_collections, :title, :string, {:default => ''}
    change_column :media_collections, :description, :string, {:default => ''}
  end
end
