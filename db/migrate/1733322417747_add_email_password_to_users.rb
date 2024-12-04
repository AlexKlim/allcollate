class AddEmailPasswordToUsers < ActiveRecord::Migration[6.0]
  def up
    add_column :users, :email, :string, null: false, default: ""
    add_column :users, :password, :string, null: false, default: ""
  end

  def down
    remove_column :users, :email
    remove_column :users, :password
  end
end