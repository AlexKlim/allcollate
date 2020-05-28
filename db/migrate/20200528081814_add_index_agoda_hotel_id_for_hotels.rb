class AddIndexAgodaHotelIdForHotels < ActiveRecord::Migration[6.0]
  def change
    add_index :hotels, :agoda_hotel_id
  end
end
