class OrdersController < ApplicationController
  def index
     @order_items = current_order.order_items
  end

  def update
    order_item_ids = params.keys.select{|key| key.include?("quantity")}.map{|k|k.sub("quantity-", "").to_i}
    order_items = OrderItem.where(id: order_item_ids)
    order_items.each do |order_item|
      product_price = order_item.product.price
      order_item.update_attributes(quantity: params["quantity-#{order_item.id}"],
      total_price: product_price*params["quantity-#{order_item.id}"].to_f)
    end
    redirect_to :back
  end
 
end
