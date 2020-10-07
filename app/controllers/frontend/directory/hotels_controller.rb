class Frontend::Directory::HotelsController < ApplicationController
  layout 'frontend'

  # before_action :check_prefix

  PER_PAGE = 75

  def show
    @hotels = if params[:prefix] == 'more'
                Hotel.active.ransack(name_not_start_all: ('a'..'z'))
              else
                Hotel.active.ransack(name_start: params[:prefix])
              end.result.page(params[:page]).per(PER_PAGE)
  end
end
