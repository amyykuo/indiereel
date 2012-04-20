class RemoveHeadshotIdAndQuickshowIdFromRoles < ActiveRecord::Migration
  def up
    remove_column :roles, :headshot_id
    remove_column :roles, :quickshow_id
  end

  def down
    add_column :roles, :quickshow_id, :integer
    add_column :roles, :headshot_id, :integer
  end
end
