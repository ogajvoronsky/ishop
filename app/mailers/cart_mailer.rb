class CartMailer < ApplicationMailer

  def product_added(product)
    @product = product
    mail(to: 'ogajvoronsky@gmail.com',
         subject: 'Product just was added!')
  end
  def create_product_added

  end
end
