class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :provider
      t.string :uid
      t.string :username
      t.string :name
      t.string :first_name
      t.string :last_name
      t.integer :timezone
      t.string :access_token
      t.string :email
      t.string :gender

      t.timestamps
    end
  end
end
