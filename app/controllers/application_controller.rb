class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  helper_method :current_user
  def current_user
  	@current_user ||= User.find_by(:id => session[:user_id]) if session[:user_id]
  	# byebug
  end

  def logged_in?
  	#tra lai la true neu da login va nguoi lai
  	!session[:user_id].nil?
  end

  def newuser
  	
  end
end
