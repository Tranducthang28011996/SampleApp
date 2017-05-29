class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  helper_method :current_user
  def current_user
  	@current_user ||= User.find_by(:id => session[:user_id]) if session[:user_id]
    # binding.pry
  	# byebug
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
end