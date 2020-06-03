class AddSlugToHotels < ActiveRecord::Migration[6.0]
  def change
    add_column :hotels, :slug, :string
    add_index :hotels, :slug, unique: true
  end
end
