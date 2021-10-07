class Brand < ApplicationRecord
  has_many :hotels

  def update_hotels_count
    hotels_count = hotels.active.count
    update_column(:hotels_count, hotels_count)
  end
end
