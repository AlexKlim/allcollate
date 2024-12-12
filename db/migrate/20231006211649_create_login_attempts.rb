class CreateLoginAttempts < ActiveRecord::Migration[6.0]
  def change
    create_table :login_attempts do |t|
      t.datetime :attempted_at
      t.boolean :successful
      t.string :ip_address
      t.references :user, null: false, foreign_key: true, index: true

      t.timestamps
    end
  end

  def down
    drop_table :login_attempts
  end
end