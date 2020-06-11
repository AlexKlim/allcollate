class Frontend::HotelsController < ApplicationController

  def show
    @hotel = Hotel.active.includes(:photos, :rates).friendly.find(params[:id]).
                   to_json(include: {
                     photos: { only: [:url, :order] },
                     rates: { only: [:currency, :daily_rate, :actual_on, :roomtype_name] }
                    })
  end
end