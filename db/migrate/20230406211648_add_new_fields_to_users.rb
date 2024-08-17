class AddNewFieldsToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :subscription_plan, :string unless column_exists?(:users, :subscription_plan)
    add_column :users, :image, :string unless column_exists?(:users, :image)
    add_column :users, :verified, :boolean, default: false unless column_exists?(:users, :verified)
    add_column :users, :login_count, :integer, default: 0 unless column_exists?(:users, :login_count)
    add_column :users, :last_login_at, :datetime unless column_exists?(:users, :last_login_at)
  end
end