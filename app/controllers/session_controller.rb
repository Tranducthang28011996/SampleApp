class SessionController < ApplicationController
  def new
  end

  def create
    @user=User.find_by(email: params[:session][:email].downcase)
  	if @user && @user.authenticate(params[:session][:password])
			session[:user_id] = @user.id
			flash[:danger] = "Welcome to the Sample App!"
			redirect_to root_url
	else
			flash[:alert] = 'Invalid email/password combination' # Not quite right!
	end
  end
  def destroy
  	session[:user_id] = nil
  	redirect_to root_url
  end
end
