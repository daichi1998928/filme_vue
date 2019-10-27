class User::FavoritesController < ApplicationController
 before_action :authenticate_user!,except:[:index]

 def index
  @favorites = current_user.favorites.order(:created_at).page(params[:page]).per(16)
 end

 def create
    product=Product.find(params[:product_id])
    favorite = current_user.favorites.new(product_id: product.id) 
    if favorite.save
      render :json => ""
    end
    
 end

 def destroy
    product=Product.find(params[:product_id])
    favorite = current_user.favorites.find_by(product_id: product.id)
    if favorite.destroy
      render :json => ""
    end
    
 end

end
