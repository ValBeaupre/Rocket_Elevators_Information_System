class CreateElevators < ActiveRecord::Migration[5.1]
  def change
    create_table :elevators do |t|
      t.integer :ColumnId
      t.bigint :Series
      t.string :Modal
      t.string :Type
      t.string :Status
      t.timestamp :Start_date
      t.timestamp :Last_check
      t.string :Certificate
      t.text :Information
      t.text :Notes

      t.timestamps
    end
  end
end
