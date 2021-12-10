class CreateHouses < ActiveRecord::Migration[6.1]
  def change
    create_table :houses do |t|
      t.string :title
      t.text :house_description
      t.string :location
      t.text :image
      t.decimal :price
      t.integer :availability
      t.decimal :discount
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
