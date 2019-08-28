class CartItem < ApplicationRecord
    belongs_to :cart

    def create_history_item!(user_id:, history:)
      product = Product.find(cart_item.product_id)
      HistoryItem.create!(product_id: cart_item.product_id,
                          product_price: product.price,
                          quantity: cart_item.quantity,
                          user_id: user_id,
                          history: history
                         )
    end
end
