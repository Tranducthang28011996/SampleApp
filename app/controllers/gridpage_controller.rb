class GridpageController < ApplicationController
	def index
		@products = Product.all
		 @specialoffer = Product.all.limit(4).offset(rand(2))
	end
end
