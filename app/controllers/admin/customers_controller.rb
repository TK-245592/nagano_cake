class Admin::CustomersController < ApplicationController
  def index
    @customers = Customer.all
  end

  def show
    @customer = Customer.find(params[:id])
  end

  def edit
       @customer = Customer.find(params[:id])
  end
  
  def updated
    @customer =Customer.find(params[:id])
    @customer.update(customer_params)
    redirect_to admin_customer_path
  end
  
  private
def customer_params
  params.require(:customer).permit(:last_name_kana, :first_name_kana, :last_name, :first_name, :postal_code, :address, :telephone_number, :is_active, :email)
end
end