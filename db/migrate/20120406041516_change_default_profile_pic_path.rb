class ChangeDefaultProfilePicPath < ActiveRecord::Migration
  def update
    change_column :roles, :profile_pic, :string, {:default => "default_role_pic.jpg"}
  end
end
