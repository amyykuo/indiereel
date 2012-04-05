class ChangePhysicalFeatureToPhysique < ActiveRecord::Migration
  def change
    rename_column(:roles, :physical_features, :physique)
  end
end
