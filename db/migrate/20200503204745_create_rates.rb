class CreateRates < ActiveRecord::Migration[6.0]
  def change
    create_table :rates do |t|
      t.belongs_to :hotel
      t.integer :partner_id
      t.string :roomtype_name

      t.string :currency
      t.float :daily_rate
      t.date :actual_on
      t.float :crossed_out_rate
      t.float :discount_percentage

      t.timestamps
    end
  end
end
