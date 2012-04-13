class AddDescriptionAndTitle < ActiveRecord::Migration
   def change
    add_column :media_collections, :mc_description, :string
    add_column :media_collections, :mc_title, :string
  end
end
