class StaticPagesController < ApplicationController
  def home
    @feature_products =  Product.all.limit(7).offset(rand(2))
    @specialoffer = Product.all.limit(4).offset(rand(2))
    @random_product = Product.all.limit(3).offset(rand(2))
    @order_item = current_order.order_items.new
  end
  
end
