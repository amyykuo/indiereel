class AddMediaCollectionIdToMediaAsset < ActiveRecord::Migration
  def change
    add_column :media_assets, :media_collection_id, :integer
  end
end
