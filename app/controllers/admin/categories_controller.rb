class Admin::CategoriesController < ApplicationController
	before_action :logged_in?, :is_admin?, :skiplayout
	def index
		@categories = Category.all
	end

	def show
		@category = Category.find(params[:id])
		@subcategories = @category.subcategories		
	end
	
	def skiplayout
		@skip_layout = true
	end
end