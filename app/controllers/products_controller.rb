class ProductsController < ApplicationController
  def index
    @products = Product.all
  end
  def show
    @product = Product.find(params[:id])
  end

  def add_to_cart
    @product = Product.find(params[:id])
    @cart_item = current_cart.cart_items.build
    @cart_item.product = @product
    @cart_item.quantity = 1
    @cart_item.save
    flash[:notice] = "已成功加入购物车！"
    redirect_to :back
  end
end
