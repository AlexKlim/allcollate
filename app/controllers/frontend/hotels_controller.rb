class Frontend::HotelsController < ApplicationController

  def show
    @hotel = Hotel.friendly.find(params[:id])
  end
end