class AuthenticationEvent < ApplicationRecord
  belongs_to :user, foreign_key: 'user_id'

  validates :email_submitted, presence: true
  validates :event_type, presence: true
  validates :user_id, presence: true
end