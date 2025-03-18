class HomeController < ApplicationController
	def ping
		render json: { status: 'okay' }, status: :ok
	end
end
