class Frontend::HomeController < Frontend::BaseController
  APP_SETTINGS = Rails.application.config_for(:app_settings)[:page][:home]

  def index
    hotels = Hotel.active.includes(:photos, :rates).where(slug: APP_SETTINGS[:hotels]).order(:star_rating)

    @hotels = HotelLandingSerializer.new(hotels, is_collection: true).serializable_hash[:data]
                                    .map { |item| item[:attributes] }

    render locals: {
      without_header: true
    }
  end
end
