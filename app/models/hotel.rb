class Hotel < ApplicationRecord
  belongs_to :brand

  has_many :rates
end