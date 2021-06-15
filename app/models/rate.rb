class Rate < ApplicationRecord
  update_index('hotels') { hotel } if Rails.env.production?
  belongs_to :hotel

  validates :hotel, uniqueness: { scope: :actual_on, message: 'should happen once per day' }
end