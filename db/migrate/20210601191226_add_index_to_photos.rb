class AddIndexToPhotos < ActiveRecord::Migration[6.1]
  def change
    add_index :photos, [:hotel_id, :order]
  end
end
