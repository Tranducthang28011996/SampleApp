class OderitemsController < ApplicationController
	def create
    @order = current_order
    @order_item = @order.order_items.new(order_item_params)
    @order.save
    session[:order_id] = @order.id
  end
  def destroy
    @order_item = current_order.order_items.find(params[:id])
    @order_item.destroy
    respond_to do |format|
        format.html {}
        format.json { head :no_content }
        format.js   { render :layout => false }
    end
  end
private
  def order_item_params
    params.permit(:product_id,:quantity, :total_price)
  end
end
