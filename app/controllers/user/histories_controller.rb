class User::HistoriesController < ApplicationController
  before_action :can_buy, only: [:new]
  include User::HistoriesHelper

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

      Payjp.api_key = ENV['SECRET_KEY']
        Payjp::Charge.create(
          amount: sum, # 決済する値段
          card: params['payjp-token'],
          currency: 'jpy'
        )
  
        current_cart.cart_items.each do |cart_item|
          @history.history_items.create(product_id: cart_item.product_id,
                                        product_price: Product.find(cart_item.product_id).price,
                                        quantity: cart_item.quantity,
                                        user_id:current_user.id
                                        )
          @product=Product.find(cart_item.product_id)
          @product.update(stock:@product.stock-cart_item.quantity)
        end
        current_cart.update(juge_use:false)
        redirect_to products_buy_path, notice: "支払いが完了しました"
    end

    def can_buy
      current_cart.cart_items.each do |cart_item|
        @product=Product.find(cart_item.product_id)
        if @product.stock-cart_item.quantity < 0
          redirect_to user_cart_item(current_cart.id), error: "#{@product.product_title}は#{@product.quantity}までしか購入が出来ません"
        end
      end
    end

    private

    def  history_params
      params.require(:history).permit(:shopping_prefecture, :shopping_city, :shopping_adress, :shopping_postal_code)
    end

end
