class CreateRooms < ActiveRecord::Migration[5.2]
  def change
    create_table :rooms do |t|
      t.string :code
      t.integer :owner_id
      t.string :name
      t.datetime :last_post_at

      t.timestamps
    end
  end
end
