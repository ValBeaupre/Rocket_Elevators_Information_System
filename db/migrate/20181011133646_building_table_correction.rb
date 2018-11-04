class BuildingTableCorrection < ActiveRecord::Migration[5.1]
  def change
    rename_column :buildings, :Amin_Phone, :Admin_Phone
  end
end
