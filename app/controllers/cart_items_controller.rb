class CartItemsController < ApplicationController
  before_action :set_cart
  before_action :set_cart_item, except: [:create]

  # POST /cart_items
  def create
    @cart_item = @cart.cart_items.build(cart_item_params.merge({count: 1}))

    @cart_item.save
    redirect_to cart_path, notice: 'Item was successfully added.'
  end

  def increase_count
    @cart_item.count += 1
    @cart_item.save
    redirect_to cart_path, notice: 'Cart item count successfully updated.'
  end

  def decrease_count
    if @cart_item.count > 1
      @cart_item.count -= 1
      @cart_item.save
    else
      @cart_item.destroy
    end
    redirect_to cart_path, notice: 'Cart item count successfully updated.'
  end

  # DELETE /cart_items/1
  def destroy
    @cart_item.destroy
    redirect_to cart_path, notice: 'Cart item was successfully removed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_cart_item
      @cart_item = @cart.cart_items.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def cart_item_params
      params.permit(:id, :product_id, :increase, :decrease)
    end

    def set_cart
      session[:current_cart_hash] ||= SecureRandom.hex(100)

      @cart = Cart.find_or_create_by(cart_hash: session[:current_cart_hash], user: current_user)
    end
end
