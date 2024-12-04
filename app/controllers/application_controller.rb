class ApplicationController < ActionController::Base
  rescue_from ActiveRecord::RecordNotFound, with: :not_found

  def not_found
    redirect_to('/', status: 301) if !request.xhr? && request.get? && request.format == :html
  end

  def common_paging_data(page, per_page, records)
    ResponseBuilder.get_paging_data(page, per_page, records)
  end

  def login
    user = User.find_by(email: params[:email])
    if user && BCrypt::Password.new(user.password) == params[:password]
      session[:user_id] = user.id
      render json: { success: true, message: 'Login successful.' }, status: :ok
    else
      render json: { success: false, message: 'Invalid email or password.' }, status: :unauthorized
    end
  end

end