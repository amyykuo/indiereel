class AddIdentifierToUser < ActiveRecord::Migration
  def change
    add_column :users, :identifier, :string
  end
end
