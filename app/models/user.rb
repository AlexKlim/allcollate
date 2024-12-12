class User < ApplicationRecord
  # Associations
  has_many :login_attempts

  # Add additional model methods or scopes below
end