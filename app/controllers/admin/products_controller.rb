class Admin::ProductsController < ApplicationController
	before_action :logged_in?, :is_admin?, :skiplayout
	def new
	
		@product = Product.new
	end

	def create
		# byebug
		 @product = Product.new(params_products)
		 @product.save
	end

	def edit
		@product = Product.find params[:id]
	end

	def destroy
		
		@product = Product.find(params[:id])
  		@product.destroy

	    respond_to do |format|
	      format.html {}
	      format.json { head :no_content }
	      format.js   { render :layout => false }
	    end
	end

	def update
		@product = Product.find params[:id]
		@product.update(params_products)
	end

	def skiplayout
		@skip_layout = true
	end


	private
	def params_products
		params.require(:product).permit(:name, :price, :disprice, :size, :color,
										:image, :total, :subcategory_id, :trademark, :description)
	end
end
