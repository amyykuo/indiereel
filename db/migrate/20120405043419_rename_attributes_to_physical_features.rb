class RenameAttributesToPhysicalFeatures < ActiveRecord::Migration
  def change
    rename_column(:roles, :attributes, :physical_features)
  end
end
