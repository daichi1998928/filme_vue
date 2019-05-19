class User::ProductsController < ApplicationController

  def search
    @search_products = Product.search(params[:product_title])
    @search_count = @search_products.count
  end

  def index

  end

  def show
    @product = Product.find(params[:id])
  end
end
