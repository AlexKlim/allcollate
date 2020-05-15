require 'progress'

namespace :migrate do
  namespace :agoda do
    desc 'Migrate Brand from agoda to coredb'
    task brands: :environment do |task|
      # set for models/agoda_core.rb
      # self.primary_key = :brand_id

      total_count = AgodaCore.select('brand_id, array_agg(hotel_id) as hotel_ids').order(:brand_id).group(:brand_id).to_a.count
      progress = Progress.new(total_count)

      AgodaCore.select('brand_id, array_agg(hotel_id) as hotel_ids').order(:brand_id).group(:brand_id).find_each do |group|
        agoda_hotel_ids = group.hotel_ids

        next if group.brand_id.zero?

        brand = Brand.find_by(agoda_brand_id: group.brand_id)
        Hotel.where(brand_id: nil, agoda_hotel_id: agoda_hotel_ids).update(brand: brand)

        progress.increment!
      end
    end
  end
end