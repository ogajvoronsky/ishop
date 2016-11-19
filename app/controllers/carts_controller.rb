class CartsController < ApplicationController
  before_action :current_cart

  def show
    @products = @cart.products
  end

  def add
    @product = Product.find(params[:product_id])
    @cart.products << @product

  end

  def destroy
    @cart.destroy
    redirect_to cart_path
  end

  def order
    @email = params[:email]
    OrderMailer.order_mail(@email, @cart.products).deliver_now
    redirect_to products_path
  end

    private
    def current_cart
      @cart = Cart.find(session[:cart_id])
    end
end
