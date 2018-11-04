class CreateAddresses < ActiveRecord::Migration[5.1]
  def change
    create_table :addresses do |t|
      t.string :Address
      t.string :Status
      t.string :Entity
      t.string :Street
      t.integer :Appartment
      t.string :City
      t.string :Zipcode
      t.string :Country
      t.text :Notes

      t.timestamps
    end
  end
end
