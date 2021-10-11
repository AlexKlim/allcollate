class Frontend::BaseController < ApplicationController
  layout 'frontend'

  after_action :track_page_view

  def track_page_view
    Services::Ga::Tracker.page_view(request.path)
  end
end
