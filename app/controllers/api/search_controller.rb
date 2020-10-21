class Api::SearchController < ApplicationController
  layout nil

  def index
    results = Hotel.active.includes(:photos, :rates).ransack(name_start: params[:q]).result.first(5)
    results = results.map do |result|
      {
        name: result.name,
        starRating: result.star_rating,
        overview: result.overview,
        slug: result.slug,
        city: result.city,
        country: result.country,
        addressline1: result.addressline1,
        photo: result.photos.order(order: :asc).first&.url,
        rate: result.rates.order(actual_on: :desc).first&.daily_rate,
        yearOpened: result.year_opened,
        yearRenovated: result.year_renovated
      }
    end

    render json: results
  end
end
