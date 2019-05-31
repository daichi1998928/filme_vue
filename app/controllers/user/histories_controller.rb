class User::HistoriesController < ApplicationController
    def finish
    end

    def new
      @user=current_user
      @history=History.new
    end

    def create
      @history=History.new(history_params)
      @history.user_id = current_user.id
      @history.save

      sum=0
      cart_items=CartItem.where(cart_id:current_cart)
 
      cart_items.each do |item|
       sum+=item.quantity*Product.find(item.product_id).price
      end

      Payjp.api_key = ENV['PRIME_KEY']
        Payjp::Charge.create(
          amount: sum, # 決済する値段
          card: params['payjp-token'],
          currency: 'jpy'
        )
  
        current_cart.cart_items.each do|cart_item|
          HistoryItem.create(product_id: cart_item.product_id,
                             product_price: Product.find(cart_item.product_id).price,
                             quantity: cart_item.quantity
                            )
        end
        
        redirect_to products_buy_path, notice: "支払いが完了しました"
    end

    private

    def  history_params
      params.require(:history).permit(:shopping_prefecture, :shopping_city, :shopping_adress, :shopping_postal_code)
    end

end
