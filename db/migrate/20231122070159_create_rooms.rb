class CreateRooms < ActiveRecord::Migration[6.1]
  def change
    create_table :rooms do |t|
      t.string :room_name
      t.string :room_content
      t.integer :room_price_day
      t.string :room_address

      t.timestamps
    end
  end
end
