class ApplicationController < ActionController::Base
  rescue_from ActiveRecord::RecordNotFound, with: :not_found

  def not_found
    redirect_to('/', status: 301) if (!request.xhr? && request.get? && request.format == :html)
  end
end
