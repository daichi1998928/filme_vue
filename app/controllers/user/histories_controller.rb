class User::HistoriesController < ApplicationController
  before_action :authenticate_user!
  before_action :can_buy, only: [:new]
  before_action :address_entry?,only: [:create,:cash_deliver]
  before_action :set_history, only: [:create, :cash_deliver]

  include User::HistoriesHelper

    def index
      @history_items=HistoryItem.where(user_id:current_user.id).order(:created_at).page(params[:page]).per(8)
    end

    def add_address
      if History.find_by(juge_use: true,user_id: current_user).nil?
         @history=History.new(history_params)
         @history.user_id = current_user.id
         @history.save
      else
        @history=History.find_by(juge_use: true, user_id: current_user.id)
        flash[:notice] = @history.update(history_params) ? "update成功" : "update失敗"
      end
      redirect_to new_user_history_path
    end

    def new
      @history=History.new
    end

    def cash_deliver
      @history.update(pay_method:2)
      current_cart.cart_items.each do |cart_item|
        cart_item.create_history_item!(user_id: current_user.id, history: @history)
        @product=Product.find(cart_item.product_id)
        @product.update(stock:@product.stock-cart_item.quantity)
      end

      binding.pry
      update_cart_and_history
      redirect_to products_buy_path, notice: "支払いが完了しました"
    end

    def create

      @histroy.update(pay_method: 1)

      transaction do
        Payjp::Charge.create(
          amount: sum, # 決済する値段
          card: params['payjp-token'],
          currency: 'jpy'
        )

        current_cart.cart_items.each do |cart_item|
          cart_item.create_history_item!(user_id: current_user.id, history: @history)
          @product=Product.find(cart_item.product_id)
          @product.update(stock:@product.stock-cart_item.quantity)
        end
      end

      update_cart_and_history
      redirect_to products_buy_path, notice: "支払いが完了しました"
    end

    private

    def update_cart_and_history
      current_cart.update(juge_use:false)
      @history.update(juge_use:false)
      @cart=Cart.create(user_id:current_user.id)
    end

    def set_history
      @history = History.find_by(juge_use: true, user_id: current_user.id)
      @history.pay_method = 1
      @history.save
    end

    def address_entry?
      if History.find_by(juge_use: true,user_id: current_user).nil?
        redirect_to new_user_history_path,notice: "住所を確定してください"
      end
    end

    def can_buy
      current_cart.cart_items.each do |cart_item|
        @product=Product.find(cart_item.product_id)
        if @product.stock-cart_item.quantity < 0
          redirect_to user_cart_item_path(current_cart.id), error: "#{@product.product_title}は#{@product.stock}個までしか購入が出来ません"
        end
      end
    end

    def history_params
      params.require(:history).permit(:prefecture, :city, :adress, :postal_code)
    end

end
