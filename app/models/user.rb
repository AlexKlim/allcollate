class User < ApplicationRecord
  validates :username, presence: true, uniqueness: true
  validates :email, presence: true, uniqueness: true, format: { with: URI::MailTo::EMAIL_REGEXP }
  validates :subscription_plan, presence: true
  validates :image, presence: true
  validates :verified, inclusion: { in: [true, false] }
  validates :password, presence: true, length: { minimum: 6 }
  # Add other model methods below
end