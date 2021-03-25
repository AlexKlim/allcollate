module ResponseBuilder
  require 'will_paginate/array'
  def self.get_paging_data(page, per_page, records)
    page < records.total_pages ? next_page_exist = true : next_page_exist = false
    page > 1 && page <= records.total_pages ? previous_page_exist = true : previous_page_exist = false
    {
        page:                page,
        per_page:            per_page,
        total_records:       records.total_entries,
        total_pages:         records.total_pages,
        next_page_exist:     next_page_exist,
        previous_page_exist: previous_page_exist
      
    }
  end

end