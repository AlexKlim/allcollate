class CreateUsers < ActiveRecord::Migration[6.1]
  def change
    create_table :users do |t|
      t.string :uid
      t.string :username
      t.string :email, null: false, index: true, unique: true
      t.string :subscription_plan, default: 'general', null: false
      t.string :image
      t.boolean :verified
      t.integer :login_count, default: 0
      t.datetime :last_login_at

      t.timestamps
    end
  end
end
