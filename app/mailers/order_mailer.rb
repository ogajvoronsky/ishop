class OrderMailer < ApplicationMailer
  def order_mail(user,products)
    @user = user
    @products = products

    mail(to: @user.email, subject: 'Your order from ishop')
  end
end
