require 'rails_helper'

RSpec.describe Item, type: :model do
  describe '出品商品の保存'
  before do
    @item = FactoryBot.build(:item)
  end

  context "商品出品がうまくいくとき" do
    it '全ての値が正しく入力されていれば保存できる' do
      expect(@item).to be_valid
    end
  end
  context "商品出品がうまくいかないとき" do
    it 'imageが空だと保存できない' do
      @item.image = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Image can't be blank")
    end
    it 'nameが空だと保存できない' do
      @item.name = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Name can't be blank")
    end
    it 'textが空だと保存できない' do
      @item.text = nil
      @item.valid?
      expect(@item.errors.full_messages).to include( "Text can't be blank")
    end
    it 'categoryが空だと保存できない' do
      @item.category_id = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Category Select")
    end
    it 'stateが空だと保存できない' do
      @item.state_id = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("State Select")
    end
    it 'delivery_feeが空だと保存できない' do
      @item.delivery_fee_id = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Delivery fee Select")
    end
    it 'prefectureが空だと保存できない' do
      @item.prefecture_id = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Prefecture Select")
    end
    it 'delivery_by_dayが空だと保存できない' do
      @item.delivery_by_day_id = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Delivery by days Select")
    end
    it 'priceが空だと保存できない' do
      @item.price = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Price can't be blank")
    end
    it 'priceが半角数字でないと保存できない' do
      @item.price = "２０００"
      @item.valid?
      expect(@item.errors.full_messages).to include("Price Half-width number")
    end
    it 'priceが¥300より低いと保存できない' do
      @item.price = 299
      @item.valid?
      expect(@item.errors.full_messages).to include("Price Out of setting range")
    end
    it 'priceが¥9,999,999より高いと保存できない' do
      @item.price = 10000000
      @item.valid?
      expect(@item.errors.full_messages).to include("Price Out of setting range")
    end
    it 'userが紐づいていなければ保存できない' do
      @item.user = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("User must exist")
    end
  end
end
