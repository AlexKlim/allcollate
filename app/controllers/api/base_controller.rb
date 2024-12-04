class Api::BaseController < ApplicationController
  layout nil

  def handle_authentication(email, password)
    user = User.find_by(email: email)
    if user && user.password == password
      # Proceed with the request as authentication is successful
    else
      log_failed_login(email: email, timestamp: Time.current, ip_address: request.remote_ip)
      render json: { error: I18n.t('errors.invalid_credentials') }, status: :unauthorized
    end
  end

  private

  def log_failed_login(email:, timestamp:, ip_address:)
    # This method should be implemented in the ResponseBuilder module
    ResponseBuilder.log_failed_login(email: email, timestamp: timestamp, ip_address: ip_address)
  rescue StandardError => e
    Rails.logger.error "Failed to log login attempt: #{e.message}"
  end
end