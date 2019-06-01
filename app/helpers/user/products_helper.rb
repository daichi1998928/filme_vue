module User::ProductsHelper
    def added_cart?(product)
      CartItem.where(id: current_cart.id, product_id: product.id).exists?
    end
end
