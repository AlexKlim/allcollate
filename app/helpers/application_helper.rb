module ApplicationHelper
  
  def common_paging_data(page, per_page, records)
    ResponseBuilder.get_paging_data(page, per_page, records)
  end

end
