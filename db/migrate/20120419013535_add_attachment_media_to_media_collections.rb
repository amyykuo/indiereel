class AddAttachmentMediaToMediaCollections < ActiveRecord::Migration
  def up
    change_table :media_collections do |t|
      t.has_attached_file :media
    end
  end

  def down
    drop_attached_file :media_collections, :media
  end
end
