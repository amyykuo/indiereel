class UpdateQuickshowHandling < ActiveRecord::Migration
  def change
    add_column :roles, :quickshow_id, :integer
    remove_column :media_collections, :quickshow
  end
end
