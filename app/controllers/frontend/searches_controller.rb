class Frontend::SearchesController < ApplicationController
  def suggestions
    results = Hotel.active.ransack(name_start: params[:q]).result.first(5)
    results = results.map do |result|
                {
                  name: result.name,
                  slug: result.slug
                }
              end

    render json: results
  end
end