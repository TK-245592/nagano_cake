class Public::CartItemsController < ApplicationController
  def index
    @cart_items = current_customer.cart_items
    @total = 0
  end

  def create
    @cart_item = CartItem.new(cart_item_params)
    @cart_items = current_customer.cart_items
  if @cart_items.find_by(item_id: @cart_item.item_id)
    @cart_item_1 = @cart_items.find_by(item_id: @cart_item.item_id)
    @new_amount = @cart_item_1.amount + @cart_item.amount
    @cart_item_1.update(amount: @new_amount)
    redirect_to public_cart_items_path
  else
    @cart_item = CartItem.new(cart_item_params)
    @cart_item.customer_id = current_customer.id
    @cart_item.save
    redirect_to public_cart_items_path
  end
  end

  def update
   @cart_item = CartItem.find(params[:id])
   @cart_item.update(cart_item_params)
   redirect_to public_cart_items_path
  end

  def destroy_all
    current_customer.cart_items.destroy_all
    redirect_to public_cart_items_path
  end

  def destroy
    @cart_item = CartItem.find(params[:id])
    @cart_item.destroy
    redirect_to public_cart_items_path
  end



  private
  def cart_item_params
    params.require(:cart_item).permit(:item_id, :amount)
  end
end