class AddDefaultToPhoneAndRemovePhysiqueFieldToRoles < ActiveRecord::Migration
  def change
    change_column :roles, :phone_number, :string, {:default => ''}
    
    remove_column :roles, :physique
  end
end
