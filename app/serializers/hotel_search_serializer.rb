class HotelSearchSerializer
  include JSONAPI::Serializer

  set_key_transform :camel_lower

  set_type :hotel
  attributes :name, :star_rating, :overview, :slug, :city, :country, :addressline1, :year_opened,
             :year_renovated

  attribute :photo do |hotel|
    hotel.photos.order(order: :asc).first&.url&.gsub(/\?s=.*/, '')
  end

  attribute :rate do |hotel|
    hotel.rates.order(actual_on: :desc).first&.daily_rate
  end

  attribute :rating do |hotel|
    hotel.rates.order(actual_on: :desc).first&.review_score
  end

  attribute :review_count do |hotel|
    hotel.rates.order(actual_on: :desc).first&.review_count
  end
end
