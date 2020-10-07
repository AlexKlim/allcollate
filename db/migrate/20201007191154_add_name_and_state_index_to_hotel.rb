class AddNameAndStateIndexToHotel < ActiveRecord::Migration[6.0]
  def change
    add_index :hotels, [:name, :hotel_state]
  end
end
