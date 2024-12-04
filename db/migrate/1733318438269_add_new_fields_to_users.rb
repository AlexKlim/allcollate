class AddNewFieldsToUsers < ActiveRecord::Migration[6.0]
  def up
    add_column :users, :subscription_plan, :string, null: false
    add_column :users, :image, :string, null: false
    add_column :users, :verified, :boolean, default: false
    add_column :users, :login_count, :integer, default: 0
    add_column :users, :last_login_at, :datetime
    add_column :users, :password, :string, null: false
  end

  def down
    remove_column :users, :subscription_plan
    remove_column :users, :image
    remove_column :users, :verified
    remove_column :users, :login_count
    remove_column :users, :last_login_at
    remove_column :users, :password
  end
end