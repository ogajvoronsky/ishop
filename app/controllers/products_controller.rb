class ProductsController < ApplicationController
  before_action :set_product, only: [:show, :destroy]

  def index
    @products = Product.all
  end

  def new
    @product = Product.new
  end

  def create
    # p params
    Product.create(products_param)
    redirect_to products_path
  end

  def show
  end

  def destory
     if @product.destroy
       redirect_to product_path, notice: 'Product was successfully deleted.'
     end
  end


  private

  def products_param
    params.require('product').permit('name','price','description')
  end

  def set_product
    @product = Product.find(params[:id])
  end
end
