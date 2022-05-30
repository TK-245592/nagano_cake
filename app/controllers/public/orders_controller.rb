class Public::OrdersController < ApplicationController
  def new
    @order = Order.new

    @postal_code_1 = current_customer.postal_code
    @address_1 = current_customer.address
    @name_1 = current_customer.last_name + current_customer.first_name
    @customer_address_1 = @postal_code_1 + @address_1 + @name_1

  end

   def confirm
    @order = Order.new(order_params)

  if params[:order][:select_address] == "0"
    @order.postal_code = current_customer.postal_code
    @order.address = current_customer.address
    @order.name = current_customer.first_name + current_customer.last_name

  elsif  params[:order][:select_address] == "1"
    @address = Address.find(params[:order][:address_id])
    @order.postal_code = @address.postal_code
    @order.address = @address.address
    @order.name = @address.name

  else params[:order][:select_address] == "2"
    @order = Order.new(order_params)

  end
    @total = 0
    @cart_items = current_customer.cart_items
  end

  def create
    @order = Order.new(order_params)
    @order.customer_id = current_customer.id
    @order.save
    redirect_to public_complete_path

      @cart_items = current_customer.cart_items
      @cart_items.each do |cart_item|
      @order_detail = OrderDetail.new
      @order_detail.order_id = cart_item.id
      @order_detail.item_id = cart_item.item_id
      @order_detail.quantity = cart_item.amount
      @order_detail.price = cart_item.item.with_tax_price
      @order_detail.save
      end
      @cart_items.destroy_all
  end

  def complete
  end

  def index
    @order = current_customer.orders
    @order_details = OrderDetail.all
  end

  def show
    @order = Order.find(params[:id])
  end

   private

  def order_params
    params.require(:order).permit(:method_of_payment, :postal_code, :address, :name, :billing_amount, :shipping_cost, :order_status)
  end

end
