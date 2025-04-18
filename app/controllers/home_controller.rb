class HomeController < ApplicationController
	def ping
		render json: { status: 'all good' }, status: :ok
	end
end
