class CartItem < ApplicationRecord
    belongs_to :cart

    def calc_sum
        sum=0
        current_cart.cart_items.each do |cart_item|
          @product=Product.find(cart_item.product_id)
          sum+=@product.price*cart_item.quantity
        end
        sum*1.08.round
    end
end
