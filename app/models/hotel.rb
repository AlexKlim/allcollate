class Hotel < ApplicationRecord
  include Sluggable

  sluggable_from :name

  belongs_to :brand

  has_many :rates
  has_many :photos
end