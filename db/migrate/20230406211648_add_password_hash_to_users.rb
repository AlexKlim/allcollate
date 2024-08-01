class AddPasswordHashToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :password_hash, :string
  end
end