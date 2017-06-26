class ReviewsController < ApplicationController
  def index
    product = Product.find params[:id]
    @reviews = product.reviews
  end
  def new
    @review = Review.new
  end
  def create
      if current_user
      @review = current_user.reviews.new(params.require(:review).permit(:content))
      @review.save
      @review.update_attributes(product_id: params[:product_id])
    else
      @review = Review.new(params.require(:review).permit(:content))
      @review.save
      @review.update_attributes(product_id: params[:product_id], newuser: 'customer')
    end
    # redirect_to reviews_path
  end

  def update
    
  end

  def destroy
    
  end

end
