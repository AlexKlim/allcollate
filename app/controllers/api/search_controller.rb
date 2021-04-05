class Api::SearchController < ApplicationController
  layout nil

  def index
    page = params[:pageNum].present? ? params[:pageNum].to_i : 1

    search_options = {}
    search_options[:name_start] = params[:q] if params[:q]
    
    if params[:locations].present? and JSON.parse(params[:locations]).present?
      locations = JSON.parse(params[:locations])
      search_options[:city_start_any]    = locations.map { |location| location['city'] }
      search_options[:country_start_any] = locations.map { |location| location['country'] }
    end
    hotels = Hotel.active.includes(:photos, :rates).ransack(search_options).result
                  .paginate(page: page, per_page: AppConstants::PERPAGE)
    results = hotels&.map do |result|
      rate = result.rates.order(actual_on: :desc).first
      {
        name: result.name,
        starRating: result.star_rating,
        overview: result.overview,
        slug: result.slug,
        city: result.city,
        country: result.country,
        addressline1: result.addressline1,
        photo: result.photos.order(order: :asc).first&.url,
        rate: rate&.daily_rate,
        yearOpened: result.year_opened,
        yearRenovated: result.year_renovated,
        rating: rate&.review_score,
        reviewCount: rate&.review_count
      }
    end
    render json: {results: results, pagingData: common_paging_data(page, AppConstants::PERPAGE, hotels)}
  end

  def locations
    results = Hotel.active.ransack(city_or_country_or_addressline1_start: params[:q]).result(distinct: true).first(5)

    results = results.map do |result|
      {
        city: result.city,
        country: result.country,
        # addressline1: result.addressline1
      }
    end

    render json: results
  end
end
