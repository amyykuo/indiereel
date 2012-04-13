class AddHeadshotsIdToMediaCollection < ActiveRecord::Migration
  def change
    add_column :roles, :headshot_id, :integer
  end
end
