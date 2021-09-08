class HotelLandingSerializer
  include JSONAPI::Serializer

  set_key_transform :camel_lower

  set_type :hotel
  attributes :name, :star_rating, :slug

  attribute :photo do |hotel|
    hotel.photos.order(order: :asc).first&.url
  end

  attribute :rate do |hotel|
    hotel.rates.order(actual_on: :desc).first&.daily_rate
  end
end
