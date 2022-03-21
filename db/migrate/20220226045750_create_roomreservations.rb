class CreateRoomreservations < ActiveRecord::Migration[6.1]
  def change
    create_table :roomreservations do |t|
      t.datetime :start_date
      t.datetime :end_date
      t.integer :person_num

      t.timestamps
    end
  end
end
