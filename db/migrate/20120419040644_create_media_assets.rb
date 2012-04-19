class CreateMediaAssets < ActiveRecord::Migration
  def change
    create_table :media_assets do |t|
      t.string :description
      t.timestamps
    end
  end
end
