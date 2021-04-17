class Services::Search::Hotel
  PER_PAGE = 10

  attr_reader :options, :page

  def initialize(query, page)
    @options = query ? { name_start: query } : {}
    @page = page.present? ? page.to_i : 1
  end

  def do
    Hotel.active.includes(:photos, :rates).ransack(options).result
         .paginate(page: page, per_page: PER_PAGE)
  end

  def add_locations!(locations)
    return unless locations

    locations = parse_json(locations)
    options[:city_start_any] = locations.map { |location| location['city'] }
    options[:country_start_any] = locations.map { |location| location['country'] }
  end

  def add_year_renovated!(yearRenovated)
    return unless yearRenovated
    yearRenovated = parse_json(yearRenovated)
    if yearRenovated.present?
      options[:year_renovated_gteq_any] = yearRenovated[0]
      options[:year_renovated_lteq_any] = yearRenovated[1]
    end
  end

  def add_year_opened!(yearOpened)
    return unless yearOpened
    yearOpened = parse_json(yearOpened)
    if yearOpened.present?
      options[:year_opened_gteq_any] = yearOpened[0]
      options[:year_opened_lteq_any] = yearOpened[1]
    end
  end
  
  private

  def parse_json(object)
    JSON.parse(object).compact
  end
end