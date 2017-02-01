require 'securerandom'


class CartsController < ApplicationController
  before_action :set_cart, only: [:show, :edit, :update, :destroy]

  # GET /carts/1
  def show
  end

  # DELETE /carts/1
  def destroy
    @cart.destroy
    redirect_to cart_url, notice: 'Cart was successfully cleaned.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_cart
      @cart = Cart.find_or_initialize_by(cart_hash: session[:current_cart_hash])
    end
end
