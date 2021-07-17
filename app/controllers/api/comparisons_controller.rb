class Api::ComparisonsController < Api::BaseController
  def index
    hotel = Hotel.active.find_by(slug: params[:slug])
    render json: nil and return unless hotel

    hotels_json = HotelCompareSerializer.new(hotel, is_collection: false).serializable_hash[:data][:attributes]

    render json: { results: hotels_json }
  end
end
