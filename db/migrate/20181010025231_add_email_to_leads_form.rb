class AddEmailToLeadsForm < ActiveRecord::Migration[5.1]
  def change
    add_column :leads, :Email, :string, :after => :Business
  end
end
