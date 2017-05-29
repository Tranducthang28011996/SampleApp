class Admin::ProductsController < ApplicationController
	before_action :logged_in?, :is_admin?, :skiplayout

	def create
		
	end

	def edit
		@product = Product.find params[:id]
	end

	def destroy
		
	end

	def update
		byebug
		@product = Product.find params[:id]
		@product.update(params_products)
	end

	def skiplayout
		@skip_layout = true
	end

	private
	def params_products
		params.require(:product).permit(:name)
	end
end