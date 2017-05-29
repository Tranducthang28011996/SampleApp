class Admin::CategoriesController < ApplicationController
	before_action :logged_in?, :is_admin?
	def index
		@skip_layout = true
	end

end