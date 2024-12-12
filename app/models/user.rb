class User < ApplicationRecord
  # Validations
  validates :uid, presence: true, uniqueness: true
  validates :username, presence: true, uniqueness: true
  validates :email, presence: true, uniqueness: true
  validates :password_hash, presence: true

  # Relationships
  has_many :login_attempts, foreign_key: :user_id
end