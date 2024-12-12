class AddUserIdToLoginAttempts < ActiveRecord::Migration[6.0]
  def change
    unless column_exists?(:login_attempts, :user_id)
      add_reference :login_attempts, :user, null: false, index: true
      add_foreign_key :login_attempts, :users
    end
  end
end