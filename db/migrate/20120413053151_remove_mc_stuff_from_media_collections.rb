class RemoveMcStuffFromMediaCollections < ActiveRecord::Migration
  def change
    remove_column(:media_collections, :mc_title)
    remove_column(:media_collections, :mc_description)
  end
end
