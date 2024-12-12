class LoginAttempt < ApplicationRecord
  belongs_to :user, foreign_key: :user_id

  validates :attempted_at, :successful, :ip_address, :user_id, presence: true
end