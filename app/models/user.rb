class User < ApplicationRecord
  has_many :login_attempts, foreign_key: 'user_id'
  # Add any new relationships or validations here if needed

  # Existing validations and business logic
end