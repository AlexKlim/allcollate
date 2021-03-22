class Hotel < ApplicationRecord
  include Sluggable

  sluggable_from :name

  belongs_to :brand, optional: true

  has_many :rates
  has_many :ratings
  has_many :photos

  enum hotel_state: { active: 'active', draft: 'draft' }
end