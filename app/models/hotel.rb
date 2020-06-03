class Hotel < ApplicationRecord
  extend FriendlyId
  friendly_id :name, use: :slugged

  belongs_to :brand

  has_many :rates
end