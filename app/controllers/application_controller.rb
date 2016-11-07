class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :set_current_cart, :set_locale
  add_flash_types :action_result

  def default_url_options
    { locale: I18n.locale }
  end

  private
  def set_current_cart
    session[:cart_id] = Cart.create.id if Cart.find_by(id: session[:cart_id]).nil?
  end

  def set_locale
    session[:locale] = params[:locale] || I18n.default_locale
    I18n.locale = session[:locale]
  end
end
