namespace :locations do
  task update: :environment do |task|
    Hotel.active.find_each do |hotel|
      location = Location.find_or_initialize_by(
        continent_name: hotel.continent_name,
        country: hotel.country,
        country_iso_code: hotel.country_iso_code,
        city: hotel.city
      )

      if location.new_record?
        location.state = hotel.state
        location.save
      elsif !location.state.present?
        location.state = hotel.state
        location.save
      end
    end
  end
end