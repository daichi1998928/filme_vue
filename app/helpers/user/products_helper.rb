module User::ProductsHelper
    def added_cart?(product)
        if CartItem.where(id: current_cart.id, product_id: product.id).empty?
            @added_cart=false
        else
            @added_cart=true
        end
    end
end
