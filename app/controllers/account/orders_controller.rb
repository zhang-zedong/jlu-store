class Account::OrdersController < ApplicationController
  before_action :authenticate_user!
  def new
    @order = Order.new
  end
  def create
    @order = current_user.orders.build(order_params)
    @order.total_price = current_cart.total_price
    if @order.save
      # create oder_items
      current_cart.cart_items.each do |cart_item|
        @order_item = @order.order_items.build
        @order_item.product_name = cart_item.product.title
        @order_item.product_price = cart_item.product.price
        @order_item.quantity = cart_item.quantity
        @order_item.save!
      end
      flash[:notice] = "订单生成成功"
      current_cart.clear
      redirect_to account_order_path(@order)
    else
      render :new
    end
  end
  def show
    @order = Order.find_by(params[:id])
  end
  private
  def order_params
    params.require(:order).permit(:customer_name, :phone_number, :address)
  end
end
