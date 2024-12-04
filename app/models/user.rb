require 'bcrypt'

class User < ApplicationRecord
  attribute :email, :string
  attribute :password, :string
  validates :email, presence: true, format: { with: URI::MailTo::EMAIL_REGEXP }
  validates :password, presence: true

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  # Method to hash a password
  def self.hash_password(password)
    BCrypt::Password.create(password)
  end
end