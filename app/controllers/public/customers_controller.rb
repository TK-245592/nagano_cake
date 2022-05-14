class Public::CustomersController < ApplicationController
  
    def unsubscribe
     @customer = current_customer
    end

  def withdraw
    @customer = current_customer
    @customer.update(is_active: false)
    redirect_to public_homes_top_path
  end
  
  def show
     @customer = Customer.find(params[:id])
  end

  def edit
     @customer = Customer.find(params[:id])
  end

  def update
    @customer = Customer.find(params[:id])
    @customer.update(customer_params)
    redirect_to public_customer_path(@customer)
  end



    private
def customer_params
  params.require(:customer).permit(:last_name_kana, :first_name_kana, :last_name, :first_name, :postal_code, :address, :telephone_number, :is_active, :email)
end

end
