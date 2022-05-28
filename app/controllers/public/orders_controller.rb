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
      
    @cart_items = current_customer.cart_items
    @total = 0

  end
  
  def create
  @order = Order.new(order_params)
  @order.customer_id = current_customer.id
  @order.save
  redirect_to public_confirm_path
  end
  
 



  def index
  end

  def show
  end

  private
  def order_params
    params.require(:order).permit(:method_of_payment, :postal_code, :address, :name)
  end
end
