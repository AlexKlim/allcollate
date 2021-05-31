class Services::EsSearch::Hotel
  PER_PAGE = 10
  SUGGESTION_SIZE = 5

  attr_reader :query, :year_renovated, :year_opened, :star_ratings, :locations, :rates, :page

  def initialize(params, page = 1)
    @query = params[:q]
    @year_renovated = parse_json(params[:yearRenovated])
    @year_opened = parse_json(params[:yearOpened])
    @star_ratings = parse_json(params[:starRating])
    @locations = parse_json(params[:locations])
    @rates = parse_json(params[:rates])
    @page = page.present? ? page.to_i : 1
  end

  def index
    HotelsIndex
  end

  def do
    [query_string, keyword_string, year_renovated_filter, year_opened_filter,
     start_rating_filter, country_filter, city_filter,
     rate_filter].compact.reduce(:merge).page(page).per(PER_PAGE).order(star_rating: :desc, id: :desc)
  end

  def query_string
    index.filter { match_all }
  end

  def keyword_string
    return unless query.present?

    index.query(multi_match: { query: query,
                               type: :cross_fields,
                               fields: [:name],
                               operator: :and })
  end

  def year_renovated_filter
    body = {}.tap do |body|
      body.merge!(gte: year_renovated[0]) if year_renovated[0] != 1000
      body.merge!(lte: year_renovated[1]) if year_renovated[1] != 2020
    end
    index.filter(range: { year_renovated: body }) if body.present?
  end

  def year_opened_filter
    body = {}.tap do |body|
      body.merge!(gte: year_opened[0]) if year_opened[0] != 705
      body.merge!(lte: year_opened[1]) if year_opened[1] != 2020
    end
    index.filter(range: { year_opened: body }) if body.present?
  end

  def start_rating_filter
    index.filter(terms: { star_rating: star_ratings }) if star_ratings.present?
  end

  def country_filter
    countries = locations.map { |location| location['country'] }
    index.filter(terms: { country: countries }) if countries.present?
  end

  def city_filter
    cities = locations.map { |location| location['city'] }
    index.filter(terms: { city: cities }) if cities.present?
  end

  def rate_filter
    body = {}.tap do |body|
      body.merge!(gte: rates[0].to_f) if rates[0] != 10
      body.merge!(lte: rates[1].to_f) if rates[1] != 1000
    end

    index.query(range: { day30_daily_rate: body }) if body.present?
  end

  def suggestion
    index.suggest(suggestion_attr).suggest['suggest']&.first&.fetch('options', [])
  end

  private

  def suggestion_attr
    {
      suggest: {
        text: query,
        completion: {
          field: :autocomplete,
          size: SUGGESTION_SIZE
        }
      }
    }
  end

  def parse_json(object)
    return unless object

    JSON.parse(object).compact
  end
end
