class AddElevatorIdToElevator < ActiveRecord::Migration[5.1]
  def change
    add_reference :elevators, :column, foreign_key: true
  end
end
