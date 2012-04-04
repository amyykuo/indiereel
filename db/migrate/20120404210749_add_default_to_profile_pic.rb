class AddDefaultToProfilePic < ActiveRecord::Migration
  def change
    change_column_default(:roles, :profile_pic, "/app/assets/images/default_role_pic.jpg")
  end
end
