class StaticPagesController < ApplicationController
  before_action :newuser, only: :home
  def index
    
  end

  def home
  end

  def help
  end

  def about
  	
  end

  def contact
  	
  end
end
