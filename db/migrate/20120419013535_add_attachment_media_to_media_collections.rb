class AddAttachmentMediaToMediaCollections < ActiveRecord::Migration
  def self.up
    change_table :media_collections do |t|
      t.has_attached_file :media
    end
    add_column :media_collections, :media_file_name, :string
    add_column :media_collections, :media_content_type, :string
    add_column :media_collections, :media_file_size, :integer
    add_column :media_collections, :media_updated_at, :datetime
  end

  def self.down

    drop_attached_file :media_collections, :media
  
    remove_column :media_collections, :media_file_name
    remove_column :media_collections, :media_content_type
    remove_column :media_collections, :media_file_size
    remove_column :media_collections, :media_updated_at
  end
end
