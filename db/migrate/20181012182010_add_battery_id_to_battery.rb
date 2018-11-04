class AddBatteryIdToBattery < ActiveRecord::Migration[5.1]
  def change
    add_reference :batteries, :building, foreign_key: true
  end
end
