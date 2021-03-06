class UsersController < ApplicationController
  def new
     redirect_to root_url
  end

  def create
  	@user = User.new(user_params)
  	if @user.save
      session[:user_id] = @user.id
      redirect_to root_url
  	else
  	end
  end

  private
  	def user_params
  		params.require(:user)
  		.permit(:name, :email, :password, :password_confirmation, :address, :mobile)
  	end
end
