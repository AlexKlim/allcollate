class LoginAttempt < ApplicationRecord
  belongs_to :user

  validates :attempted_at, presence: true
  validates :success, inclusion: { in: [true, false] }
  validates :ip_address, presence: true
  validates :user_id, presence: true
end