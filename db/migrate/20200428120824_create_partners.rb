class CreatePartners < ActiveRecord::Migration[6.0]
  def change
    create_table :partners do |t|
      t.string :name
      t.string :affiliate_url
      t.string :api_key

      t.timestamps
    end
  end
end
