class BrandsIndex < Chewy::Index
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

  index_scope Brand.where('hotels_count > 0')
  field :id, type: 'integer'
  field :brand_name, :hotels_count
  field :autocomplete, {
    value: lambda do
      { input: brand_name }
    end,
    type: 'completion',
    analyzer: 'full_string'
  }
end
