class CreateJoinTableHousesReservations < ActiveRecord::Migration[6.1]
  def change
    create_join_table :houses, :reservations do |t|
      # t.index [:house_id, :reservation_id]
      # t.index [:reservation_id, :house_id]
    end
  end
end
