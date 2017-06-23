class DetailsController < ApplicationController
  def show
    @products = Product.all.limit(7).offset(rand(2))
    @product = Product.find params[:id]
  end
end
