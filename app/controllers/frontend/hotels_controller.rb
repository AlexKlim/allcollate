class Frontend::HotelsController < ApplicationController
  layout 'frontend'

  def show
    @hotel = Hotel.active.includes(:photos, :rates).friendly.find(params[:id])
  end
end
