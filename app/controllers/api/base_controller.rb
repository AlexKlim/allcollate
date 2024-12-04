class Api::BaseController < ApplicationController
  layout nil

  def create
    user = User.new(user_params)
    user.password = User.hash_password(params[:password])
    if user.save
      render json: { success: true, message: 'User created successfully.' }, status: :created
    else
      render json: { success: false, errors: user.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def update
    user = User.find(params[:id])
    user.password = User.hash_password(params[:password]) if params[:password].present?
    if user.save
      render json: { success: true, message: 'User updated successfully.' }, status: :ok
    else
      render json: { success: false, errors: user.errors.full_messages }, status: :unprocessable_entity
    end
  end
end