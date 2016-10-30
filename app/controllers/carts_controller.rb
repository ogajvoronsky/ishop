class CartsController < ApplicationController

  def show
    @cart = Cart.find(session[:cart_id])
    @products = @cart.products
  end

  def add
    @cart = current_cart
    @product = Product.find(params[:product_id])
    @cart.products << @product
  end

  def empty
    @cart = current_cart
    @cart.destroy
  end

    private

    def current_cart
      Cart.find(session[:cart_id])
    end
end
