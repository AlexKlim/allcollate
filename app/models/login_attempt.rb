class LoginAttempt < ApplicationRecord
  belongs_to :user, foreign_key: 'user_id'

  validates :attempted_at, presence: true
  validates :successful, inclusion: { in: [true, false] }
  validates :ip_address, presence: true
  validates :user_id, presence: true

  # Additional business logic or custom methods can be added here
end