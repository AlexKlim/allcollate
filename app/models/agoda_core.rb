class AgodaCore < ApplicationRecord
  validates :hotel_formerly_name, length: { maximum: 255 }
end