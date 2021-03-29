class ApplicationController < ActionController::Base
  rescue_from ActiveRecord::RecordNotFound, with: :not_found
  
  
  def not_found
    redirect_to('/', status: 301) if (!request.xhr? && request.get? && request.format == :html)
  end
  
  def common_paging_data(page, per_page, records)
    ResponseBuilder.get_paging_data(page, per_page, records)
  end
  
end
