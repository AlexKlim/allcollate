class AddNameIndexForHotels < ActiveRecord::Migration[6.0]
  def change
    add_index :hotels, :name
  end
end
