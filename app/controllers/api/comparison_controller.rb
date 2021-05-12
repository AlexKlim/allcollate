class Api::ComparisonController < ApplicationController
  layout nil

  def index
    search = Services::Search::Hotel.new(params[:q], params[:pageNum])
    search.add_locations!(params[:locations])
    search.add_year_renovated!(params[:yearRenovated])
    search.add_year_opened!(params[:yearOpened])
    search.add_start_rating!(params[:starRating])
    search.add_rates!(params[:rates])

    hotels = search.do

    hotels_json = HotelSearchSerializer.new(hotels, is_collection: true).serializable_hash[:data]
                                       .map { |item| item[:attributes] }

    render json: { results: hotels_json,
                   pagingData: common_paging_data(search.page, Services::Search::Hotel::PER_PAGE, hotels) }
  end

  def hotels
    results = Hotel.active.ransack(name_start: params[:q]).result(distinct: true).first(5)

    results = results.map do |result|
      {
       name:  result.name,
       overview: result.overview,
       star_rating: result.star_rating,
       checkin: result.checkin,
       checkout: result.checkout,
       number_rooms: result.number_rooms,
       number_floors: result.number_floors,
       year_opened: result.year_opened,
       year_renovated: result.year_renovated,
       addressline1: result.addressline1,
       zipcode: result.zipcode,
       city: result.city,
       state: result.state,
       country: result.country
      }
    end

    render json: results
  end
end
