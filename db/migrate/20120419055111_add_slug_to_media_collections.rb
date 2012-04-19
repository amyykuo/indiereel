class AddSlugToMediaCollections < ActiveRecord::Migration
  def change
    add_column :media_collections, :slug, :string
  end
end
