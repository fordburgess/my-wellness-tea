class ApplicationController < ActionController::Base
  before_action :current_cart
  before_action :cart_total
  before_action :set_locale
  helper_method :current_user

  def after_sign_in_path_for(resource)
    if resource.admin?
      admin_root_path
    else
      root_path
    end
  end

  private

    def set_locale
      I18n.locale = params[:locale] || I18n.default_locale
    end

    def default_url_options
      { locale: I18n.locale }
    end

    def current_cart
      if session[:cart_id]
        cart = Cart.find_by(:id => session[:cart_id])
        if cart.present?
          @current_cart = cart
        else
          session[:cart_id] = nil
        end
      end

      if session[:cart_id] == nil
        @current_cart = Cart.create
        session[:cart_id] = @current_cart.id
      end
    end

    def cart_total
      if @current_cart.present?
        @cart_total = @current_cart.line_items.sum { |line_item|
          product = Product.find(line_item.product_id)
          product.price * line_item.quantity
        }
      end
    end
end
