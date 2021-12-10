class CreateReservations < ActiveRecord::Migration[6.1]
  def change
    create_table :reservations do |t|
      t.integer :rent_duration
      t.date :rent_start_date
      t.decimal :rent_total_price
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
