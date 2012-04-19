class AddAttachmentMediaToMediaAssets < ActiveRecord::Migration
  def up
    add_column :media_assets, :media_file_name, :string
    add_column :media_assets, :media_content_type, :string
    add_column :media_assets, :media_file_size, :integer
    add_column :media_assets, :media_updated_at, :datetime
  end

  def down
    remove_column :media_assets, :media_file_name
    remove_column :media_assets, :media_content_type
    remove_column :media_assets, :media_file_size
    remove_column :media_assets, :media_updated_at
  end
end
