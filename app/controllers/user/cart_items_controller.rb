class User::CartItemsController < ApplicationController
	
	def show
        @cart_items = CartItem.where(cart_id: current_cart)
	end
	
	def create
		cart_item=current_cart.cart_items.new(product_id: params[:product_id], cart_id: current_cart.id)
		cart_item.save
		redirect_to user_product_path(params[:product_id])
	end

	def destroy 
		cart_item=current_cart.cart_items.find_by(product_id: params[:id], cart_id: current_cart.id)
		cart_item.destroy
		redirect_to user_product_path(params[:id])
	end

	def update
		@cart_item=CartItem.find(params[:id])
		if params[:add]=='true'
			@cart_item.update(quantity:@cart_item.quantity+1)
		else 
			@cart_item.update(quantity:@cart_item.quantity-1) unless @cart_item.quantity-1==0
		end
		redirect_to user_cart_item_path(current_cart)
	end

  private
	def cart_items_params
	   params.require(:cart_item).permit(:product_id)
	end

end
