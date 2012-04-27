class AddPreviousIdToMediaAssets < ActiveRecord::Migration
  def change
    add_column :media_assets, :previous_id, :integer
  end
end
