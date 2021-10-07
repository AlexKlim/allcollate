namespace :brands do
  task update_hotels_count: :environment do
    Brand.reset_column_information
    Brand.all.each do |brand|
      brand.update_hotels_count
    end

  end
end