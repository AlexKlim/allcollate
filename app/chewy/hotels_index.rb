class HotelsIndex < Chewy::Index
  settings analysis: {
    analyzer: {
      full_string: {
        tokenizer: 'keyword',
        filter: ['lowercase', 'asciifolding', 'trim'],
        char_filter: 'replace_special_symbols'
      }
    },
    char_filter: {
      replace_special_symbols: {
        type: 'pattern_replace',
        pattern: '[^\\w\\s-]',
        replacement: ''
      }
    }
  }

  index_scope Hotel.active.includes(:photos, :rates)
  default_import_options batch_size: 100, bulk_size: 10.megabytes, refresh: false

  field :id, type: 'integer'
  field :name, :overview, :slug, :addressline1
  field :country, type: 'keyword'
  field :city, type: 'keyword'
  field :year_renovated, type: 'integer'
  field :year_opened, type: 'integer'
  field :star_rating, type: 'integer'
  field :day30_daily_rate, type: 'float', value: ->(hotel) do
    daily_rates = hotel.rates.where('actual_on >= ?', Date.today - 1.months).map(&:daily_rate)
    (daily_rates.inject(0.0) { |sum, el| sum + el } / daily_rates.size)&.round(2)
  end
  field :photo, value: ->(hotel) { hotel.photos.order(order: :asc).first&.url }
  field :rate, type: 'float', value: ->(hotel) { hotel.rates.order(actual_on: :desc).first&.daily_rate }
  field :rating, type: 'float', value: ->(hotel) { hotel.rates.order(actual_on: :desc).first&.review_score }
  field :review_count, type: 'integer', value: ->(hotel) { hotel.rates.order(actual_on: :desc).first&.review_count }

  field :autocomplete, {
    value: -> {
      { input: [name].compact }
    },
    type: 'completion',
    analyzer: 'full_string'
  }
end
