class CreateBrands < ActiveRecord::Migration[6.0]
  def change
    create_table :brands do |t|
      t.string :brand_name
      t.string :agoda_brand_id

      t.timestamps
    end
  end
end
