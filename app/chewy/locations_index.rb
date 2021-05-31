class LocationsIndex < Chewy::Index
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

  index_scope Location
  field :id, type: 'integer'
  field :city, :country
  field :autocomplete, {
    value: -> {
      { input: ([city] + [country]).compact }
    },
    type: 'completion',
    analyzer: 'full_string'
  }
end
