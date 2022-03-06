class AddRoomIdToRoomreservation < ActiveRecord::Migration[6.1]
  def change
    add_reference :roomreservations, :room, null: false, foreign_key: true
  end
end
