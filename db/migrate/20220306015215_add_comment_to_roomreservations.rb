class AddCommentToRoomreservations < ActiveRecord::Migration[6.1]
  def change
    add_column :roomreservations, :comment, :string
  end
end
