class HotelCompareSerializer
  include JSONAPI::Serializer

  set_key_transform :camel_lower

  set_type :hotel
  attributes :name, :star_rating, :slug, :city, :country, :addressline1, :year_opened,
             :year_renovated, :checkin, :checkout, :number_rooms, :number_floors

  attribute :photo do |hotel|
    hotel.photos.order(order: :asc).first&.url
  end

  attribute :rates do |hotel|
    hotel.rates.order(actual_on: :desc)
  end

  attribute :review_score do |hotel|
    hotel.rates.order(actual_on: :desc).first&.review_score
  end

  attribute :review_count do |hotel|
    hotel.rates.order(actual_on: :desc).first&.review_count
  end
end
