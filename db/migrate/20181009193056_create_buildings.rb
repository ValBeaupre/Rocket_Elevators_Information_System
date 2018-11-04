class CreateBuildings < ActiveRecord::Migration[5.1]
  def change
    create_table :buildings do |t|
      t.integer :CustommerID
      t.integer :Address
      t.string :Admin_Full_Name
      t.string :Admin_email
      t.string :Amin_Phone
      t.string :Tech_Full_Name
      t.string :Tech_email
      t.string :Tech_Phone

      t.timestamps
    end
  end
end
