class ApplicationController < ActionController::Base
   protect_from_forgery with: :exception
   helper_method :current_cart

  # before_action :configure_permitted_parameters, if: :devise_controller?
  #
  # protected
  #
  # def configure_permitted_parameters
  #   devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
  # end

  def after_sign_in_path_for(resource)
    case resource
    when Admin
      new_admin_product_path
    when User
      user_products_path
    end
  end

  def after_sign_up_path_for(resource)
    case resource
    when Admin
      new_admin_product_path
    when User
      user_products_path
    end
  end





  def current_cart
    if Cart.find_by(juge_use: true,user_id: current_user).nil?
      @cart=Cart.create(user_id:current_user.id)
    else
      @cart = Cart.find_by(juge_use: true,user_id: current_user)
    end
  end

end
