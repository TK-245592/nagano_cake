class Admin::ItemsController < ApplicationController
  def index
  end

  def new
  end

  def show
  end

  def edit
  end
  
  private
  
  def item_params
    params.require(:item).permit(:name, :introduction, :price, :is_active, :image)
  end
  
end
