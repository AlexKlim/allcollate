class HomeController < ApplicationController
	def ping
		render json: { status: 'here we go' }, status: :ok
	end
end
