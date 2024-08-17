class AuthenticationEvent < ApplicationRecord
  belongs_to :user, foreign_key: 'user_id'

  validates :email_submitted, presence: true
  validates :event_type, presence: true
  validates :user_id, presence: true
  
  # Logs an email validation event
  def log_email_validation(email, event_type, user_id = nil)
    AuthenticationEvent.create(
      email_submitted: email,
      event_type: event_type,
      user_id: user_id,
      created_at: Time.current
    )
  end
end