class CreateLocationsTable < ActiveRecord::Migration[6.1]
  def change
    create_table :locations do |t|
      t.string :continent_name
      t.string :country
      t.string :country_iso_code
      t.string :state
      t.string :city

      t.timestamps
    end

    add_index :locations, [:city, :country]
  end
end
