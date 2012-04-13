class AddQuickshowFlagToMc < ActiveRecord::Migration
  def change
    add_column :media_collections, :quickshow, :boolean
  end
end
