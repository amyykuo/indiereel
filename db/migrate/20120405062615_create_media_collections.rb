class CreateMediaCollections < ActiveRecord::Migration
  def change
    create_table :media_collections do |t|
      t.integer :role_id
      t.string :title
      t.string :description

      t.timestamps
    end
  end
end
