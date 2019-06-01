class User::ProductsController < ApplicationController

  def search
    @search_products = Product.search(params[:product_title])
    @search_count = @search_products.count
  end

  def index
    @products=Product.all

  end

  def create
 
  end


  def show
    @product = Product.find(params[:id])
    @traks1=Track.where(product_id:@product.id).where(disk_num:1).order(:track_order)
    @traks2=Track.where(product_id:@product.id).where(disk_num:2).order(:track_order)
    @related_product=Product.where("product_title LIKE ?","%#{@product.product_title}%").where.not(product_title: "#{@product.product_title}")
    @new_product_review = ProductReview.new

    if @product.product_reviews.exists?
      @product_review_average = @product.product_reviews.average(:rate).ceil.to_s
      @product_review_average_file = 'star' + @product_review_average + '.png'
    end
  end



end
