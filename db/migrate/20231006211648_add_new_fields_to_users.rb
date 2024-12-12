class AddNewFieldsToUsers < ActiveRecord::Migration[6.0]
  def up
    add_column :users, :uid, :string, null: false, unique: true
    add_column :users, :username, :string, null: false, unique: true
    add_column :users, :email, :string, null: false, unique: true
    add_column :users, :subscription_plan, :string
    add_column :users, :image, :string
    add_column :users, :verified, :boolean, default: false
    add_column :users, :login_count, :integer, default: 0
    add_column :users, :last_login_at, :datetime
    add_column :users, :password_hash, :string, null: false
  end

  def down
    remove_column :users, :uid
    remove_column :users, :username
    remove_column :users, :email
    remove_column :users, :subscription_plan
    remove_column :users, :image
    remove_column :users, :verified
    remove_column :users, :login_count
    remove_column :users, :last_login_at
    remove_column :users, :password_hash
  end
end