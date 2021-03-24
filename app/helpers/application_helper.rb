module ApplicationHelper
  
  def error_messages(error_array)
    error_string = ''
    error_array.errors.full_messages.each_with_index do |message, message_index|
      error_string += message
      if message_index != (error_array.errors.full_messages.size - 1)
        error_string += ', '
      end
    end
    error_string
  end
  
  def common_paging_data(page, per_page, records)
    ResponseBuilder.get_paging_data(page, per_page, records)
  end

end
