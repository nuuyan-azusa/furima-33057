class ItemsController < ApplicationController
  def index
    @items = Item.all
  end
  def new
    @item = Item.new
  end
  def create
    @item = Item.create(item_params)
  end
  
  private item_params
    params.require(:item).permit(:text,:price,:name,:category_id,:state_id,:delivery_fee_id,:prefecture_id,:delivery_by_days_id)
end
