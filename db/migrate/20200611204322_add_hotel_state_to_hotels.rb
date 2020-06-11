class AddHotelStateToHotels < ActiveRecord::Migration[6.0]
  def change
    add_column :hotels, :hotel_state, :string, default: 'draft'
    add_index :hotels, [:id, :hotel_state]
    add_index :hotels, [:slug, :hotel_state]
  end
end
