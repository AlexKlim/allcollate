class ApplicationController < ActionController::Base
  rescue_from ActiveRecord::RecordNotFound, with: :not_found

  helper_method :current_user, :current_user_attributes

  def not_found
    redirect_to('/', status: 301) if !request.xhr? && request.get? && request.format == :html
  end

  def common_paging_data(page, per_page, records)
    ResponseBuilder.get_paging_data(page, per_page, records)
  end

  def current_user
    @current_user ||= User.find_by(id: session[:user_id])
  end

  def current_user_attributes
    {
      info: current_user&.attributes || nil,
      access: {
        fullComparison: current_user && !current_user.subscription_plan_general?
      },
      settings: User.settings.to_h.deep_transform_keys { |key| key.to_s.camelcase(:lower) }
    }
  end
end
