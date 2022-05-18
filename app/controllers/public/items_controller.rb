class Public::ItemsController < ApplicationController
  def index
    @items = Item.all
    @item = Item.count
  end

  def show
  end
end
