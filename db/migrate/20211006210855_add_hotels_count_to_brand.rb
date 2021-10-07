class AddHotelsCountToBrand < ActiveRecord::Migration[6.1]
  def change
    add_column :brands, :hotels_count, :integer, default: 0
  end
end
