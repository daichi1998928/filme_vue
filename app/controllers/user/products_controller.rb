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
    @product_review = ProductReview.new
  end
end
