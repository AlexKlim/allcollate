class Api::BaseController < ApplicationController
  layout nil

  def authenticate_user
    email = params[:email]
    password = params[:password]

    user = User.find_by(email: email)

    if user.nil? || !user.password_secure_compare(password)
      render json: { error: 'Invalid credentials' }, status: 401
      return
    end

    session_token = generate_session_token(user)

    render json: { token: session_token, userId: user.id }
  end

  private

  def generate_session_token(user)
    # Placeholder for token generation logic
    "generated_token_#{user.id}"
  end
end