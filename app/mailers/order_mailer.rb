class OrderMailer < ApplicationMailer
  def order_mail(email, products)
    @email = email
    @products = products
    mail(to: @email, subject: 'Your order from ishop')
  end
end
