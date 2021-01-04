class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new,:edit]
  before_action :set_item, only: [:show,:edit,:update,:destroy]
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

  def show
  end

  def edit
    unless user_signed_in? && current_user.id == @item.user.id
      redirect_to root_path
    end
  end

  def update
    if @item.update(item_params)
      redirect_to item_path(@item.id)
    else
      render :edit
    end
  end

  def destroy
    unless user_signed_in? && current_user.id == @item.user.id
      redirect_to root_path
    end
    if @item.destroy
      redirect_to root_path
    else
      render :show
    end
    end
  end

  def set_item
    @item = Item.find(params[:id])
  end

  private

  def item_params
    params.require(:item).permit(:text, :price, :name, :category_id, :state_id, :delivery_fee_id, :prefecture_id, :delivery_by_day_id,
                                 :image).merge(user_id: current_user.id)
  end
end
