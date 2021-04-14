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

  def yearRenovated!(yearRenovated)
    return unless yearRenovated
    yearRenovated = parse_json(yearRenovated)
    search_options[:year_renovated_gteq_any] = yearRenovated[0]
    search_options[:year_renovated_lteq_any] = yearRenovated[1]
  end
  
  private

  def parse_json(object)
    JSON.parse(object)
  end
end