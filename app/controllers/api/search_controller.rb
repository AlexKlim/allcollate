class Api::SearchController < ApplicationController
  layout nil

  def index
    results = Hotel.active.includes(:photos, :rates).ransack(name_start: params[:q]).result
    results = results.map do |result|
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
        rating: rate&.review_score
      }
    end

    render json: results
  end

  def locations
    results = Hotel.active.ransack(city_or_country_or_addressline1_start: params[:q]).result(distinct: true).first(5)

    results = results.map do |result|
      {
        city: result.city,
        country: result.country,
        addressline1: result.addressline1
      }
    end

    render json: results
  end
end
