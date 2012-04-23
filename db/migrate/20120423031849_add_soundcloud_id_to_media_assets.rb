class AddSoundcloudIdToMediaAssets < ActiveRecord::Migration
  def change
    add_column :media_assets, :soundcloud_id, :string
  end
end
