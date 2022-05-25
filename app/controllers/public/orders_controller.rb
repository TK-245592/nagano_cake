class Public::OrdersController < ApplicationController
  def new
    @order = Order.new
    
    @postal_code = current_customer.postal_code
    @address = current_customer.address
     last_name = current_customer.last_name
     first_name = current_customer.first_name
    @name = last_name + first_name
    @new_address = @postal_code + @address + @name
    
  end

  def create

  end

  def index
  end

  def show
  end

  private
  def order_params
    params.require(:order).permit(:postal_code, :address, :name, :method_of_payment)
  end
end
