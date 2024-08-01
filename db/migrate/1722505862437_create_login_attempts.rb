class CreateLoginAttempts < ActiveRecord::Migration[6.1]
  def change
    create_table :login_attempts do |t|
      t.datetime :attempted_at, null: false
      t.boolean :successful, null: false, default: false
      t.string :ip_address, null: false
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end