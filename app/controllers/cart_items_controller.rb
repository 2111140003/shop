# app/controllers/cart_items_controller.rb
class CartItemsController < ApplicationController
  before_action :set_cart_item, only: [:destroy]

  def new
    @product = Product.find(params[:product_id])
    @cart_item = current_cart.cart_items.new
  end

  def create
    product = Product.find_by(id: params[:product_id])
    cart = current_cart

    if product
      cart_item = cart.cart_items.find_by(product_id: product.id)

      if cart_item
        cart_item.increment(:qty)
      else
        cart_item = cart.cart_items.build(product: product)
      end

      if cart_item.save
        redirect_to cart_path(cart), notice: 'Item added to cart.'
      else
        flash[:alert] = 'Failed to add item to cart.'
        redirect_back fallback_location: product
      end
    else
      flash[:alert] = 'Product not found.'
      redirect_back fallback_location: root_path
    end
  end

  def destroy
    @cart_item.destroy
    redirect_to cart_path(current_cart), notice: 'Item was removed from the cart.'
  end

  private

  def set_cart_item
    @cart_item = CartItem.find(params[:id])
  end

  def cart_item_params
    params.require(:cart_item).permit(:qty, :product_id)
  end
end
