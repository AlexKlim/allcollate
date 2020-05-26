require 'progress'

namespace :agoda do
  namespace :hotels do
    desc 'Update rates for hotels'
    task update_rates: :environment do |task|
      AgodaHotelStatsWorker.perform_async
    end
  end
end