class CreateBatteries < ActiveRecord::Migration[5.1]
  def change
    create_table :batteries do |t|
      t.integer :BuildingID
      t.string :Type
      t.string :Status
      t.integer :EmployeeID
      t.date :Commissionning
      t.timestamp :Last_Inspection
      t.string :Operation_Certificate
      t.string :Information
      t.string :Notes

      t.timestamps
    end
  end
end
