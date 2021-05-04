class Services::Search::Hotel
  PER_PAGE = 10

  attr_reader :options, :page

  def initialize(query, page)
    @options = query ? { name_start: query } : {}
    @page = page.present? ? page.to_i : 1
  end

  def do
    Hotel.active.includes(:photos, :rates).ransack(options).result.order(star_rating: :desc)
         .paginate(page: page, per_page: PER_PAGE)
  end

  def add_locations!(locations)
    return unless locations

    locations = parse_json(locations)
    options[:city_start_any] = locations.map { |location| location['city'] }
    options[:country_start_any] = locations.map { |location| location['country'] }
  end

  def add_year_renovated!(year_renovated)
    return unless year_renovated

    year_renovated = parse_json(year_renovated)
    return unless year_renovated.present?

    options[:year_renovated_gteq_any] = year_renovated[0]
    options[:year_renovated_lteq_any] = year_renovated[1]
  end

  def add_year_opened!(year_opened)
    return unless year_opened

    year_opened = parse_json(year_opened)
    return unless year_opened.present?

    options[:year_opened_gteq_any] = year_opened[0]
    options[:year_opened_lteq_any] = year_opened[1]
  end

  def add_start_rating!(star_rating)
    return unless star_rating

    star_rating = parse_json(star_rating)
    return unless star_rating.present?

    options[:star_rating_in] =  star_rating.map { |single_rating| single_rating }
  end

  def add_rates(hotels, rates)
    return unless rates

    rates = parse_json(rates)
    return_hotel_ids = []

    hotels.each do |single_hotel|
      avg_hotel_rate = single_hotel.rates.where('created_at >= ?', Date.today - 1.month).average(:daily_rate).to_i
      if avg_hotel_rate.between?(rates[0],rates[1])
        return_hotel_ids << single_hotel.id
      end
    end

    Hotel.active.includes(:photos, :rates).where(id: return_hotel_ids).order(star_rating: :desc)
      .paginate(page: page, per_page: PER_PAGE)
  end

  private

  def parse_json(object)
    JSON.parse(object).compact
  end
end
