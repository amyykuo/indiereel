class AddDescriptionAndTitleAgain < ActiveRecord::Migration
  def change
    add_column :media_collections, :mc_description, :string
    add_column :media_collections, :mc_title, :string
    remove_column :media_collections, :title
    remove_column :media_collections, :description
  end
end
