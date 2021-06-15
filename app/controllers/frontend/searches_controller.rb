class Frontend::SearchesController < ApplicationController
  layout 'frontend'

  def suggestions
    results = if Rails.env.development? || Rails.env.test?
                Hotel.active.ransack(name_start: params[:q]).result.first(5)
              else
                search = Services::EsSearch::Hotel.new(params)
                search.suggestion.map { |suggest| suggest['_source'] }
              end

    results = results.map do |result|
                {
                  name: result['name'],
                  slug: result['slug'],
                  city: result['city'],
                  country: result['country']
                }
              end

    render json: results
  end

  def show; end
end
