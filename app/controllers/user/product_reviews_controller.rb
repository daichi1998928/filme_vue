class User::ProductReviewsController < ApplicationController
  before_action :authenticate_user!
  
  def create
    product = Product.find(params[:product_id])
    product_review = ProductReview.new(product_review_params)
    product_review.product_id = product.id
    product_review.user_id = current_user.id

    product_review.save

    redirect_to user_product_path(product)
  end

  private
  def product_review_params
    params.require(:product_review).permit(:rate)
  end

end
