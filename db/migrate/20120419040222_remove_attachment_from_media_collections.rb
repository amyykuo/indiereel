class RemoveAttachmentFromMediaCollections < ActiveRecord::Migration
  def up
  	drop_attached_file :media_collections, :media
  end

  def down
  	change_table :media_collections do |t|
      t.has_attached_file :media
    end
  end
end
