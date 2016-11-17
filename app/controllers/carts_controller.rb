class CartsController < ApplicationController
  before_action :current_cart

  def show
    @products = @cart.products
  end

  def add
    @product = Product.find(params[:product_id])
    @cart.products << @product

    # CartMailer.create_product_added(@product)
  end

  def destroy
    @cart.destroy
    redirect_to cart_path
  end

  def order
    @email = params[:email]
    OrderMailer.order_mail(@user,@products).deliver_later
    p @email
  end

    private
    def current_cart
      @cart = Cart.find(session[:cart_id])
    end
end
