class User::CartItemsController < ApplicationController

  def show
  	@user = current_user
  	@cart_item = CartItem.find(params[:id])
  end

  private
	def cart_items_params
	   params.require(:cart_item).permit(:quantity)
	end

end
