class CartItem < ApplicationRecord
    belongs_to :cart

    def create_history_item!(user_id:, history:)
      product = Product.find(self.product_id)
      HistoryItem.create!(product_id: self.product_id,
                          product_price: product.price,
                          quantity: self.quantity,
                          user_id: user_id,
                          history: history
                         )
                        
    end
end
