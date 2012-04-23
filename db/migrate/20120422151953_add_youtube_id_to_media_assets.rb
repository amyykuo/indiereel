class AddYoutubeIdToMediaAssets < ActiveRecord::Migration
  def change
    add_column :media_assets, :youtube_id, :string
  end
end
