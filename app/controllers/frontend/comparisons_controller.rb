class Frontend::ComparisonsController < ApplicationController
  layout 'frontend'

  def hotels
    results = Hotel.active.ransack(name_start: params[:q]).result.first(5)
    results = results.map do |result|
                {
                  name: result.name,
                  slug: result.slug,
                  city: result.city,
                  country: result.country
                }
              end

    render json: results
  end

  def show
    scope = Hotel.active
    # if params[:hotels]
    #   scope = scope.where('lower(city) = ? and lower(country_iso_code) = ?',
    #                       params[:locations][:city],
    #                       params[:locations][:iso])
    # end

    @results = scope.ransack(name_start: params[:q]).result.first(5)
  end
end