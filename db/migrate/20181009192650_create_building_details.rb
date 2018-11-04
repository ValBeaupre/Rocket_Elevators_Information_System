class CreateBuildingDetails < ActiveRecord::Migration[5.1]
  def change
    create_table :building_details do |t|
      t.integer :BuildingId
      t.string :Information_Key
      t.string :Value

      t.timestamps
    end
  end
end
