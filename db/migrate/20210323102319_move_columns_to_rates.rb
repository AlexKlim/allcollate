class MoveColumnsToRates < ActiveRecord::Migration[6.1]
  def change
    add_column :rates, :star_rating, :float
    add_column :rates, :review_count, :integer
    add_column :rates, :review_score, :float

    drop_table :ratings
  end
end