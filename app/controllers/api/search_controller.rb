class Api::SearchController < ApplicationController
  layout nil

  def index
    hotels_json = if Rails.env.development? || Rails.env.test?
                    search = Services::Search::Hotel.new(params[:q], params[:pageNum])
                    search.add_locations!(params[:locations])
                    search.add_year_renovated!(params[:yearRenovated])
                    search.add_year_opened!(params[:yearOpened])
                    search.add_start_rating!(params[:starRating])
                    search.add_rates!(params[:rates])

                    hotels = search.do
                    HotelSearchSerializer.new(hotels, is_collection: true).serializable_hash[:data]
                                         .map { |item| item[:attributes] }
                  else
                    search = Services::EsSearch::Hotel.new(params, params[:pageNum])
                    hotels = search.do
                    hotels.map(&:attributes).map do |row|
                      row.deep_transform_keys { |key| key.to_s.camelize(:lower) }
                    end
                  end

    render json: { results: hotels_json,
                   pagingData: common_paging_data(search.page, Services::Search::Hotel::PER_PAGE, hotels) }
  end

  def locations
    results = if Rails.env.development? || Rails.env.test?
                Location.ransack(city_or_country_start: params[:q]).result(distinct: true).first(5)
              else
                search = Services::EsSearch::Location.new(params[:q])
                search.suggestion.map { |suggest| suggest['_source'] }
              end
    results = results.map do |result|
      {
        city: result['city'],
        country: result['country']
      }
    end

    render json: results
  end
end
