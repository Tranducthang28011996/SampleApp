class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  helper_method :current_user, :topcategories, :current_order
  def current_user
  	@current_user ||= User.find_by(:id => session[:user_id]) if session[:user_id]
  end

  def logged_in?
  	if session[:user_id].nil?
    redirect_to root_url
  end
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

end