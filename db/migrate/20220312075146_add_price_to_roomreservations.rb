class AddPriceToRoomreservations < ActiveRecord::Migration[6.1]
  def change
    add_column :roomreservations, :price, :integer
  end
end
