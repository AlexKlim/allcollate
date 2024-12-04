require 'bcrypt'

class User < ApplicationRecord
  attribute :email, :string
  attribute :password, :string
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  # Method to hash a password
  def self.hash_password(password)
    BCrypt::Password.create(password)
  end
end