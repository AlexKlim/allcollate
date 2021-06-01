class AddIndexToRates < ActiveRecord::Migration[6.1]
  def change
    add_index :rates, [:hotel_id, :actual_on]
  end
end
