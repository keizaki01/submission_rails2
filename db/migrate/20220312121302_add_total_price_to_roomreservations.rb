class AddTotalPriceToRoomreservations < ActiveRecord::Migration[6.1]
  def change
    add_column :roomreservations, :total_price, :integer
  end
end
