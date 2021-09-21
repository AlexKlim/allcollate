class HomeController < ApplicationController
	def ping
		render json: { status: 'ok' }, status: :ok
	end
end