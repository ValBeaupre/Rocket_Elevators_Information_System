class CreateColumns < ActiveRecord::Migration[5.1]
  def change
    create_table :columns do |t|
      t.integer :BatteryId
      t.string :Type
      t.integer :Floors
      t.string :Status
      t.text :Information
      t.text :Notes

      t.timestamps
    end
  end
end
