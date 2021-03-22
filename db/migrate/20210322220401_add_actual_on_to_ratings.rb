class AddActualOnToRatings < ActiveRecord::Migration[6.1]
  def change
    add_column :ratings, :actual_on, :date
    remove_column :ratings, :roomtype_name
  end
end
