class ChangeProfilePicDefaultValue < ActiveRecord::Migration
  def change
    change_column :roles, :profile_pic, :string, {:default => "path to default pic here"}
  end
end
