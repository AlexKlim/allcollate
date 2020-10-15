class Frontend::SearchesController < ApplicationController
  layout 'frontend'

  def suggestions
    results = Hotel.active.ransack(name_start: params[:q]).result.first(5)
    results = results.map do |result|
                {
                  name: result.name,
                  slug: result.slug,
                  city: result.city,
                  country: result.country,
                }
              end

    render json: results
  end

  def show
    @results = Hotel.active.ransack(name_start: params[:q]).result.first(5)
  end
end