class User < ApplicationRecord
  # Columns
  validates :uid, presence: true, uniqueness: true
  validates :username, presence: true
  validates :email, presence: true, uniqueness: true
  validates :verified, inclusion: { in: [true, false] }
  validates :login_count, numericality: { only_integer: true }

  # Relations
  has_many :authentication_events, foreign_key: 'user_id'

  # Class methods
  def self.email_exists?(email)
    exists?(email: email)
  end
end