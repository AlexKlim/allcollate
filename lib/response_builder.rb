require 'will_paginate/array'

module ResponseBuilder
  def self.get_paging_data(page, per_page, records)
    next_page_exist = page < records.total_pages
    previous_page_exist = page > 1 && page <= records.total_pages

    {
      page: page,
      perPage: per_page,
      totalRecords: records.total_entries,
      totalPages: records.total_pages,
      nextPageExist: next_page_exist,
      previousPageExist: previous_page_exist
    }
  end

  def self.log_failed_login(email:, timestamp:, ip_address:)
    Rails.logger.info "Failed login attempt for email: #{email} at #{timestamp}, IP: #{ip_address}"
  rescue StandardError => e
    Rails.logger.error "Error logging failed login attempt: #{e.message}"
  end
end
end