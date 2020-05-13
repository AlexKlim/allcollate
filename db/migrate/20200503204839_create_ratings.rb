class CreateRatings < ActiveRecord::Migration[6.0]
  def change
    create_table :ratings do |t|
      t.belongs_to :hotel
      t.integer :partner_id
      t.string :roomtype_name

      t.float :star_rating

      t.integer :review_count
      t.float :review_score

      t.timestamps
    end
  end
end
