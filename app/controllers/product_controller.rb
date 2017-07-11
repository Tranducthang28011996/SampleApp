class ProductController < ApplicationController
  def index
    
  end

  def search
    if params[:q].nil?
        @product = []
    else
        @product = Product.search params[:q]
    end
  end
end
