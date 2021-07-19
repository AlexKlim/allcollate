class Frontend::HomeController < ApplicationController
  HOTELS_SLUGS = ['the-st-regis-san-francisco', 'hotel-arenal-bilbao', 'miniattico']

  def index
    hotels = Hotel.active.includes(:photos, :rates).where(slug: HOTELS_SLUGS).order(:star_rating)

    @hotels = HotelLandingSerializer.new(hotels, is_collection: true).serializable_hash[:data]
                                    .map { |item| item[:attributes] }
  end
end
