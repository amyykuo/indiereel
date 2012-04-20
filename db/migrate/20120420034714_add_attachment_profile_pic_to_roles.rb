class AddAttachmentProfilePicToRoles < ActiveRecord::Migration
  def change
    add_column :roles, :profile_pic_file_name, :string
    add_column :roles, :profile_pic_content_type, :string
    add_column :roles, :profile_pic_file_size, :integer
    add_column :roles, :profile_pic_updated_at, :datetime
  end
end
