class Admin::SubcategoriesController < ApplicationController
	before_action :logged_in?, :is_admin?, :skiplayout
	def index
	end
	def show
		# byebug
		@subcategory = Subcategory.find params[:category_id]
		@products = @subcategory.products

	end
	def skiplayout
		@skip_layout = true
	end
end