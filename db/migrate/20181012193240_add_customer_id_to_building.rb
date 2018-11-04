class AddCustomerIdToBuilding < ActiveRecord::Migration[5.1]
  def change
    add_reference :buildings, :customer, foreign_key: true
  end
end
