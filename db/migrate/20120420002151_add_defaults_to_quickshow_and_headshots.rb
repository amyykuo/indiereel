class AddDefaultsToQuickshowAndHeadshots < ActiveRecord::Migration
  def change
    change_column :media_collections, :quickshow, :boolean, {:default => false}
    change_column :media_collections, :headshot, :boolean, {:default => false}
  end
end
