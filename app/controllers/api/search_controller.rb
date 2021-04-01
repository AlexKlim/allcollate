class Api::SearchController < ApplicationController
  layout nil

  def index
    page = params[:pageNum].present? ? params[:pageNum].to_i : 1
    ids = []
    if params[:q].present?
      hotels = Hotel.active.includes(:photos, :rates).ransack(city_or_country_or_name_start: params[:q]).result.paginate(page: page, per_page: AppConstants::PERPAGE)
    end
    locations = JSON.parse(params[:locations])
    locations&.each do |location|
      ids << Hotel.active.includes(:photos, :rates).where(city: location["city"], country: location["country"])
    end
    if ids.present?
      hotels = Hotel.active.includes(:photos, :rates).where(id: ids.flatten.map(&:id)).paginate(page: page, per_page: AppConstants::PERPAGE)
    end
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

  # def locationHotels
  #   page = params[:pageNum].present? ? params[:pageNum].to_i : 1
  #   hotels = []
  #
  #   if params[:q].present?
  #     tags = JSON.parse(params[:q])
  #
  #     tags.each do |singleItem|
  #       hotels << Hotel.active.includes(:photos, :rates).where(city: singleItem["city"], country: singleItem["country"])
  #     end
  #
  #     if hotels.present?
  #       hotels = Hotel.active.includes(:photos, :rates).where(id: hotels.flatten.map(&:id)).paginate(page: page, per_page: AppConstants::PERPAGE)
  #     end
  #   elsif params[:q].present? == false
  #     hotels = Hotel.active.includes(:photos, :rates).paginate(page: page, per_page: AppConstants::PERPAGE)
  #   end
  #
  #   results = hotels.map do |result|
  #     rate = result.rates.order(actual_on: :desc).first
  #     {
  #       name: result.name,
  #       starRating: result.star_rating,
  #       overview: result.overview,
  #       slug: result.slug,
  #       city: result.city,
  #       country: result.country,
  #       addressline1: result.addressline1,
  #       photo: result.photos.order(order: :asc).first&.url,
  #       rate: rate&.daily_rate,
  #       yearOpened: result.year_opened,
  #       yearRenovated: result.year_renovated,
  #       rating: rate&.review_score
  #     }
  #   end
  #   render json: {results: results, pagingData: common_paging_data(page, AppConstants::PERPAGE, hotels)}
  # end
end
