class AddUserIdToRoomreservation < ActiveRecord::Migration[6.1]
  def change
    add_reference :roomreservations, :user, null: false, foreign_key: true
  end
end
