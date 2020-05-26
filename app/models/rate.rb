class Rate < ApplicationRecord
  belongs_to :hotel

  validates :hotel, uniqueness: { scope: :actual_on, message: 'should happen once per day' }
end