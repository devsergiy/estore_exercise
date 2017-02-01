class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :authenticate_user!
  before_action :cart_items_count

  def cart_items_count
    cart = Cart.find_by(cart_hash: session[:current_cart_hash], user: current_user)
    @cart_item_count = cart.item_count if cart
  end
end
