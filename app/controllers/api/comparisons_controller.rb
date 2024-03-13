class Api::ComparisonsController < Api::BaseController
  include ComparisonHelper

  def index
    slugs = prepare_slugs(params[:slugs].split(','))
    hotels = Hotel.active.where(slug: slugs)
    render json: [] and return unless hotels

    hotels_json = HotelCompareSerializer.new(hotels, is_collection: true).serializable_hash[:data]
                                        .map { |item| item[:attributes] }

    render json: { results: hotels_json }
  end
end
