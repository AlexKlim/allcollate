class Api::BaseController < ApplicationController
  layout nil

  def authenticate_user
    email = params[:email]
    password = params[:password]
    user = User.find_by(email: email)

    if user && user.authenticate(password)
      payload = {
        user_id: user.id,
        email: user.email,
        exp: 24.hours.from_now.to_i
      }
      token = JWT.encode(payload, 'your_secret_key', 'HS256')
      render json: { token: token }, status: :ok
    else
      render json: { error: 'Invalid email or password' }, status: :unauthorized
    end
  end
  
end