class User::ProductsController < ApplicationController

  def search
    @search_products = Product.search(params[:product_title])
    @search_count = @search_products.count
  end

  def index
    @products=Product.all

  end

  def show
  end

  def show
    @product = Product.find(params[:id])
    @new_product_review = ProductReview.new
    @product_review_average = @product.product_reviews.average(:rate).ceil.to_s
    @product_review_average_file = 'star' + @product_review_average + '.png'

  end
end
