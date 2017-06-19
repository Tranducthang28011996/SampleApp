class ProductController < ApplicationController
	def index
		byebug
		# render layout: false
		@test = params[:product_id]
	end
end
