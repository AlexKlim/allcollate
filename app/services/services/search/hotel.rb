class Services::Search::Hotel
  PER_PAGE = 10

  attr_reader :options, :page

  def initialize(query, page)
    @options = query ? { name_start: query } : {}
    @page = page.present? ? page.to_i : 1
  end

  def do
    Hotel.active.includes(:photos, :rates).ransack(options).result.order(star_rating: :desc, id: :asc)
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

    options[:year_renovated_gteq_any] = year_renovated[0] if year_renovated[0] != 1000
    options[:year_renovated_lteq_any] = year_renovated[1] if year_renovated[1] != 2020
  end

  def add_year_opened!(year_opened)
    return unless year_opened

    year_opened = parse_json(year_opened)
    return unless year_opened.present?

    options[:year_opened_gteq_any] = year_opened[0] if year_opened[0] != 705
    options[:year_opened_lteq_any] = year_opened[1] if year_opened[1] != 2020
  end

  def add_start_rating!(star_rating)
    return unless star_rating

    star_rating = parse_json(star_rating)
    return unless star_rating.present?

    options[:star_rating_in] = star_rating.map { |single_rating| single_rating }
  end

  def add_rates!(rates)
    return unless rates

    rates = parse_json(rates)
    return unless rates.present?

    if rates[0] != 10 && rates[1] != 1000
      options[:latest_rates_between] = rates
    elsif rates[0] == 10 && rates[1] != 1000
      options[:latest_rates_less_than] = rates[1]
    elsif rates[0] != 10 && rates[1] == 1000
      options[:latest_rates_more_than] = rates[0]
    end
  end

  private

  def parse_json(object)
    JSON.parse(object).compact
  end
end
