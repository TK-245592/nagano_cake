class Public::AddressesController < ApplicationController
  def index
    @address = Order.new
    @addresses = Order.all
  end
  
  def create
  end

  def edit
  end
end
