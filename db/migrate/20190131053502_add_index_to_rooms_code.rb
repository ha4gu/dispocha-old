class AddIndexToRoomsCode < ActiveRecord::Migration[5.2]
  def change
    add_index :rooms, :code, unique: true
  end
end
