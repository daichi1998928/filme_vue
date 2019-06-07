class User::FavoritesController < ApplicationController
 def like
 end

 def unlike
 end

 def index
  @favorites=current_user.favorites.order(:created_at).page(params[:page]).per(8)
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
