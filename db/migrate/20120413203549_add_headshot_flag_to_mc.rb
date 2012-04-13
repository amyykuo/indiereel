class AddHeadshotFlagToMc < ActiveRecord::Migration
  def change
    add_column :media_collections, :headshot, :boolean
  end
end
