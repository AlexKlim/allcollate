class Frontend::Directory::HotelsController < Frontend::BaseController
  # before_action :check_prefix

  PER_PAGE = 75

  def show
    @hotels = if params[:prefix] == 'more'
                Hotel.active.ransack(name_not_start_all: ('a'..'z'))
              else
                Hotel.active.ransack(name_start: params[:prefix])
              end.result.page(params[:page]).per_page(PER_PAGE)
  end
end
