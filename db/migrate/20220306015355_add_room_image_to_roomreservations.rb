class AddRoomImageToRoomreservations < ActiveRecord::Migration[6.1]
  def change
    add_column :roomreservations, :room_image, :string
  end
end
