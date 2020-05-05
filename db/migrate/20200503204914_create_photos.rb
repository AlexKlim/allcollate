class CreatePhotos < ActiveRecord::Migration[6.0]
  def change
    create_table :photos do |t|
      t.belongs_to :hotel

      t.integer :partner_id
      t.string :url
      t.integer :order

      t.timestamps
    end
  end
end
