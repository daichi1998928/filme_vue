module User::HistoriesHelper
    def sum
        sum=0
        cart_items=CartItem.where(cart_id:current_cart)
        cart_items.each do |item|
         sum+=item.quantity*Product.find(item.product_id).price
        end
        sum*1.08.round
    end
end
