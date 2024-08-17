class Api::BaseController < ApplicationController
  layout nil

  # POST /api/validate_email
  def validate_email
    email = params[:email]
    if email_valid?(email)
      if User.email_exists?(email)
        AuthenticationEvent.new.log_email_validation(email, 'email_validation', current_user&.id)
        render json: { accountExists: true, nextStep: 'authentication' }
      else
        render json: { accountExists: false, error: I18n.t('errors.messages.email_not_found') }, status: :not_found
      end
    else
      render json: { error: I18n.t('errors.messages.invalid_email_format') }, status: :unprocessable_entity
    end
  end

  private

  def email_valid?(email)
    email_regex = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
    email_regex.match?(email)
  end

  # Define other private methods and actions below as needed
end