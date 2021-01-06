require 'rails_helper'

RSpec.describe UserOrder, type: :model do
  describe '購入情報の保存'
  before do
    @user_order = FactoryBot.build(:user_order)
  end

  context '商品購入がうまくいく時' do
    it '全ての値が正しく入力されていれば保存できる' do
      expect(@user_order).to be_valid
    end
    it 'building_nameは空でも保存できる' do
      @user_order.building_name = nil
      @user_order.valid?
    end
  end
  context '商品購入がうまくいかない時' do
    it 'tokenが空だと保存できない' do
      @user_order.token = nil
      @user_order.valid?
      expect(@user_order.errors.full_messages).to include("Token can't be blank")
    end
    it 'postal_codeが空だと保存できない' do
      @user_order.postal_code = nil
      @user_order.valid?
      expect(@user_order.errors.full_messages).to include("Postal code can't be blank")
    end
    it 'postal_codeにはハイフンがないと保存できない' do
      @user_order.postal_code = '1234567'
      @user_order.valid?
      expect(@user_order.errors.full_messages).to include('Postal code Input correctly')
    end
    it 'prefecture_idが空だと保存できない' do
      @user_order.prefecture_id = nil
      @user_order.valid?
      expect(@user_order.errors.full_messages).to include('Prefecture Select')
    end
    it 'cityが空だと保存できない' do
      @user_order.city = nil
      @user_order.valid?
      expect(@user_order.errors.full_messages).to include("City can't be blank")
    end
    it 'house_numberが空だと保存できない' do
      @user_order.house_number = nil
      @user_order.valid?
      expect(@user_order.errors.full_messages).to include("House number can't be blank")
    end
    it 'phone_numberが空だと保存できない' do
      @user_order.phone_number = nil
      @user_order.valid?
      expect(@user_order.errors.full_messages).to include("Phone number can't be blank")
    end
    it 'phone_numberはハイフンがあると保存できない' do
      @user_order.phone_number = '090-1234-5678'
      @user_order.valid?
      expect(@user_order.errors.full_messages).to include('Phone number Phone number Input only number')
    end
    it 'phone_numberは11桁以内でないと保存できない' do
      @user_order.phone_number = '090123456789'
      @user_order.valid?
      expect(@user_order.errors.full_messages).to include("Phone number Phone number Input only number")
    end
  end
end
