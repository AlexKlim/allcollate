class UpdateAgodaCoresTable < ActiveRecord::Migration[6.0]
  def up
    change_table :agoda_cores do |t|
      t.string :hotel_formerly_name, limit: 255
    end
  end

  def down
    change_table :agoda_cores do |t|
      t.remove :hotel_formerly_name
    end
  end
end