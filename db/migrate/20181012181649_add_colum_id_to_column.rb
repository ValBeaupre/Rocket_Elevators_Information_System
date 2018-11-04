class AddColumIdToColumn < ActiveRecord::Migration[5.1]
  def change
    add_reference :columns, :battery, foreign_key: true
  end
end
