class LoginAttempt < ApplicationRecord
  belongs_to :user, foreign_key: 'user_id'

  validates :attempted_at, presence: true
  validates :successful, inclusion: { in: [true, false] }
  validates :ip_address, presence: true
  validates :user_id, presence: true

  # Additional business logic or custom methods can be added here

  def self.log_attempt(user_id:, attempted_at:, successful:, ip_address:)
    create(
      user_id: user_id,
      attempted_at: attempted_at,
      successful: successful,
      ip_address: ip_address
    )
  end
end