class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  helper_method :current_user, :topcategories, :current_order, :sum_items, :list_items, :autocomplete

  def current_user
  	@current_user ||= User.find_by(:id => session[:user_id]) if session[:user_id]
  end

  def logged_in?
    if session[:user_id].nil?
      redirect_to root_url
    end
  end
  def auto_product
    Product.all.map{|k| k.name}
  end

  def is_admin?
    if current_user.role.eql? 'admin'
    else
      redirect_to root_url
     end
  end

  def topcategories
    @top_categories = Product.last(4)
  end

  def current_order
    if !session[:order_id].nil?
      Order.find(session[:order_id])
    else
      Order.new
    end
  end

  def sum_items
    product_id = current_order.order_items.map{|key| key.product_id}
    item_quantity = current_order.order_items.map{|key| key.quantity}
    product_price = product_id.map{|a| Product.find(a).price}
    sum_product = item_quantity.zip(product_price).map{|x,y| x*y}.sum
  end
  
  def list_items
    if current_order
      @order_items = current_order.order_items.map{|key| key.product_id}
      @list_order_items= @order_items.map{|k| Product.find(k)}
    else
    end
  end
end
