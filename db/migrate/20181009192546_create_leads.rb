class CreateLeads < ActiveRecord::Migration[5.1]
  def change
    create_table :leads do |t|
      t.text :Full_name
      t.string :Business
      t.string :Phone
      t.string :Project_Name
      t.text :Description
      t.string :Department
      t.text :Message

      t.timestamps
    end
  end
end
