class ChangeProfilePicDefaultValue < ActiveRecord::Migration
  def change
    change_column :roles, :profile_pic, :string, {:default => "/app/assets/images/default_role_pic.jpg"}
  end
end
