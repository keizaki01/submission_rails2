class AddRoomNameToRoomreservations < ActiveRecord::Migration[6.1]
  def change
    add_column :roomreservations, :room_name, :string
  end
end
