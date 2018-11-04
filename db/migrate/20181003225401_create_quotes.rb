class CreateQuotes < ActiveRecord::Migration[5.1]
  def change
    create_table :quotes do |t|
      t.text :value
      t.integer :nb_apartments
      t.integer :nb_floors
      t.integer :nb_basements
      t.integer :nb_parkings
      t.integer :nb_shafts
      t.integer :nb_occupants
      t.integer :nb_hours
      t.string :business
      t.string :fullname
      t.text :phone

      t.timestamps
    end
  end
end
