class CreateLoginAttempts < ActiveRecord::Migration[6.0]
  def change
    create_table :login_attempts do |t|
      t.datetime :created_at, null: false
      t.datetime :updated_at, null: false
      t.datetime :attempted_at, null: false
      t.boolean :success, null: false
      t.string :ip_address, null: false
      t.references :user, null: false, foreign_key: true, index: true

      t.timestamps
    end
  end
end