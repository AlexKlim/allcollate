class LoginAttempt < ApplicationRecord
  belongs_to :user, foreign_key: 'user_id'

  validates :attempted_at, presence: true
  validates :successful, inclusion: { in: [true, false] }
  validates :ip_address, presence: true
  validates :user_id, presence: true

  def self.log_attempt(user_id:, ip_address:, successful:)
    create(
      user_id: user_id,
      ip_address: ip_address,
      successful: successful,
      attempted_at: Time.current
    )
  end
end