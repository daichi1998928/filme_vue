class User::ProductsController < ApplicationController

  def search
    @search_products = Product.search(params[:product_title])
    @search_count = @search_products.count
  end

  def index
    @products=Product.all
    
  end

  def show
    @product=Product.find(params[:id])
    @traks1=Track.where(product_id:@product.id).where(disk_num:1).order(:track_order)
    @traks2=Track.where(product_id:@product.id).where(disk_num:2).order(:track_order)
    @related_product=Product.where("product_title LIKE ?","%#{@product.product_title}%")
                      .where.not(product_title: "#{@product.product_title}")
  end

  def show
    @product = Product.find(params[:id])
  end
end
