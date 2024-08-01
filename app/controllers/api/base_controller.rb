class Api::BaseController < ApplicationController
  layout nil

  # Method to log login attempts
  def log_login_attempt(user_id:, attempted_at:, successful:, ip_address:)
    asd = 123
    LoginAttempt.log_attempt(
      user_id: user_id,
      attempted_at: attempted_at,
      successful: successful,
      ip_address: ip_address
    )

end
