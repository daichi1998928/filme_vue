class User::FavoritesController < ApplicationController
 def like
 end

 def unlike
 end

 def index
  @favorites=Favorite.where(user_id:current_user.id).order("created_at ASC") 
  @favo_products=[]
  @favorites.each do |favorite|
   val1=Product.find(favorite.product_id)
   @favo_products<<[val1]
  end
 end

 def create
    product=Product.find(params[:product_id])
    favorite = current_user.favorites.new(product_id: product.id)
    favorite.save
    redirect_to user_product_path(product.id)
 end
 
 def destroy
    product=Product.find(params[:product_id])
    favorite = current_user.favorites.find_by(product_id: product.id)
    favorite.destroy
    redirect_to user_product_path(product.id)
 end

end
