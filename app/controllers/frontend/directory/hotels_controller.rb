class Frontend::Directory::HotelsController < Frontend::BaseController
  # before_action :check_prefix

  PER_PAGE = 75

  def show
    # Moved permanently for the legacy URLs
    if params[:page]
      path = "#{params[:prefix]}-#{params[:page]}"
      redirect_to hotel_directory_path(path), status: :moved_permanently and return
    end

    @prefix, @page = params[:prefix].split('-')
    @hotels = if @prefix == 'more'
                Hotel.active.ransack(name_not_start_all: ('a'..'z'))
              else
                Hotel.active.ransack(name_start: @prefix)
              end.result.order(:name).page(@page).per_page(PER_PAGE)
  end
end
