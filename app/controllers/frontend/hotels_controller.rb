class Frontend::HotelsController < Frontend::BaseController
  def show
    @hotel = Hotel.active.includes(:photos, :rates).friendly.find(params[:id])
  end
end
