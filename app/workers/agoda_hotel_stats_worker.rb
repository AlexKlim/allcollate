class AgodaHotelStatsWorker
  include Sidekiq::Worker

  def perform
    Services::AgodaImporter.new.hotel_stats!
  end
end