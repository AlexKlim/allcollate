class AgodaHotelStatsWorker
  include Sidekiq::Worker

  def perform
    Services::AgodaImporter.new.import_hotel_stats!
  end
end