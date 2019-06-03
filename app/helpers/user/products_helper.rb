module User::ProductsHelper
  def added_cart?(product,cart_id)
    CartItem.where(cart_id: cart_id, product_id: product.id).exists?
  end
end
