class User < ApplicationRecord
  has_many :login_attempts, foreign_key: 'user_id'
  # Add any new relationships or validations here if needed

  # Existing validations and business logic

+  # Authenticates the user by comparing the provided password_hash with the stored one
+  def authenticate(password_hash)
+    self.password_hash == password_hash
+  end
end