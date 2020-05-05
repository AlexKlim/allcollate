class CreateHotels < ActiveRecord::Migration[6.0]
  def change
    create_table :hotels do |t|
      t.belongs_to :brand

      t.string :name
      t.text :overview
      t.integer :star_rating

      t.string :checkin
      t.string :checkout
      t.integer :number_rooms
      t.integer :number_floors
      t.integer :year_opened
      t.integer :year_renovated

      t.string :addressline1
      t.string :zipcode
      t.string :city
      t.string :state
      t.string :country
      t.string :country_iso_code
      t.float :longitude
      t.float :latitude
      t.string :continent_name

      t.integer :agoda_hotel_id
      t.integer :agoda_continent_id
      t.integer :agoda_city_id
      t.integer :agoda_country_id
      t.string :agoda_url

      t.timestamps
    end
  end
end
