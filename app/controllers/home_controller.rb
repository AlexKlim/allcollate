class HomeController < ApplicationController
	def index; end

	def ping
		render json: { status: 'ok' }, status: :ok
	end
end