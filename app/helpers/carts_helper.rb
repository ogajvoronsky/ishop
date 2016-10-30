module CartsHelper
  def cart_partial
    if @products.empty? ? 'empty' : 'list'
    end
  end
end

