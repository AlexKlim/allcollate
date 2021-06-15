class Location < ApplicationRecord
  update_index('locations') { self } if Rails.env.production?
end
