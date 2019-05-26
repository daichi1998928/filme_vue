class User::CartItemsController < ApplicationController

  def show
  	@user = current_user
  	@cart_item = CartItem.find(params[:id])
	end
	
	def create
		@cart_item=current_cart.cart_items.new(:product_id)
		@cart_item.save
		redirect_to user_product_path(:product_id)
	end

  private
	def cart_items_params
	   params.require(:cart_item).permit(:product_id)
	end

end
