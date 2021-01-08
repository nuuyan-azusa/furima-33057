class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :edit, :destroy]
  before_action :set_item, only: [:show, :edit, :update, :destroy]
  before_action :move_item, only: [:edit, :destroy]
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
  end

  def update
    if @item.update(item_params)
      redirect_to item_path(@item.id)
    else
      render :edit
    end
  end

  def destroy
    if @item.destroy
      redirect_to root_path
    else
      render :show
    end
  end

  private

  def set_item
    @item = Item.find(params[:id])
  end

  def move_item
    redirect_to root_path unless current_user.id == @item.user.id
    if @item.order.present?
      redirect_to root_path
    end
  end

  def item_params
    params.require(:item).permit(:text, :price, :name, :category_id, :state_id, :delivery_fee_id, :prefecture_id, :delivery_by_day_id,
                                 :image).merge(user_id: current_user.id)
  end
end
