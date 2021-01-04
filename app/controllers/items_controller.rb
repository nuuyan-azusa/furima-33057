class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new]
  def index
    @items = Item.includes(:user).order('created_at DESC')
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.valid?
      @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  private

  def item_params
    params.require(:item).permit(:text, :price, :name, :category_id, :state_id, :delivery_fee_id, :prefecture_id, :delivery_by_day_id,
                                 :image).merge(user_id: current_user.id)
  end
end
