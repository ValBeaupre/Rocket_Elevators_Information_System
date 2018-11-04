class CreateCustomers < ActiveRecord::Migration[5.1]
  def change
    create_table :customers do |t|
      t.integer :UserId
      t.timestamp :Creation_date
      t.string :Business
      t.string :Headquarters
      t.string :Full_name

      t.timestamps
    end
  end
end
