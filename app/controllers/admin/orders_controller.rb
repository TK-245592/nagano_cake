class Admin::OrdersController < ApplicationController
  def show
    @order = Order.find(params[:id])
    @order_details = Order_detail.all
  end
  
  private
  def order_params
    params.require(:order).permit(:customer_id, :postal_code, :address, :name, :shipping_cost, :billing_amount, :method_of_payment, :order_status)
  end
end
