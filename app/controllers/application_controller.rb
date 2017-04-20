class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  helper_method :current_cart
  def current_cart
    @current_cart ||= Cart.find_by(id: session[:cart_id])
    if @current_cart.blank?
      @current_cart = Cart.create!
    end
    session[:cart_id] = @current_cart.id
    @current_cart
  end

end
