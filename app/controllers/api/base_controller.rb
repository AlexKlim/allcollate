class Api::BaseController < ApplicationController
  layout nil

  def authenticate_user
    email = params[:email]
    password = params[:password]

    user = User.find_by(email: email)

    if user.nil? || !user.authenticate(password)
      render json: { message: 'Incorrect credentials' }, status: 401
    else
      token = generate_jwt_token(user)
      render json: { message: 'Login successful', token: token }
    end
  end

  private

  def generate_jwt_token(user)
    JWT.encode({ user_id: user.id, exp: 24.hours.from_now.to_i }, Rails.application.secrets.secret_key_base)
  end
end

end
end