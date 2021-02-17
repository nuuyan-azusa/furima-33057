require 'rails_helper'

RSpec.describe Item, type: :model do
  describe '出品商品の保存'
  before do
    @item = FactoryBot.build(:item)
  end

  context '商品出品がうまくいくとき' do
    it '全ての値が正しく入力されていれば保存できる' do
      expect(@item).to be_valid
    end
  end
  context '商品出品がうまくいかないとき' do
    it 'imageが空だと保存できない' do
      @item.image = nil
      @item.valid?
      expect(@item.errors.full_messages).to include('画像を入力してください')
    end
    it 'nameが空だと保存できない' do
      @item.name = nil
      @item.valid?
      expect(@item.errors.full_messages).to include('商品名を入力してください')
    end
    it 'textが空だと保存できない' do
      @item.text = nil
      @item.valid?
      expect(@item.errors.full_messages).to include('商品の説明を入力してください')
    end
    it 'category_idが0だと保存できない' do
      @item.category_id = 0
      @item.valid?
      expect(@item.errors.full_messages).to include('カテゴリーを選択してください')
    end
    it 'state_idが0だと保存できない' do
      @item.state_id = 0
      @item.valid?
      expect(@item.errors.full_messages).to include('商品の状態を選択してください')
    end
    it 'delivery_fee_idが0だと保存できない' do
      @item.delivery_fee_id = 0
      @item.valid?
      expect(@item.errors.full_messages).to include('配送料の負担を選択してください')
    end
    it 'prefecture_idが0だと保存できない' do
      @item.prefecture_id = 0
      @item.valid?
      expect(@item.errors.full_messages).to include('発送元の地域を選択してください')
    end
    it 'delivery_by_day_idが0だと保存できない' do
      @item.delivery_by_day_id = 0
      @item.valid?
      expect(@item.errors.full_messages).to include('発送までの日数を選択してください')
    end
    it 'priceが空だと保存できない' do
      @item.price = nil
      @item.valid?
      expect(@item.errors.full_messages).to include('販売価格を入力してください')
    end
    it 'priceが半角数字でないと保存できない' do
      @item.price = '２０００'
      @item.valid?
      expect(@item.errors.full_messages).to include('販売価格を半角数字で入力してください')
    end
    it 'priceが¥300より低いと保存できない' do
      @item.price = 299
      @item.valid?
      expect(@item.errors.full_messages).to include('販売価格は300以上の値にしてください')
    end
    it 'priceが¥9,999,999より高いと保存できない' do
      @item.price = 10_000_000
      @item.valid?
      expect(@item.errors.full_messages).to include('販売価格は9999999以下の値にしてください')
    end
    it 'userが紐づいていなければ保存できない' do
      @item.user = nil
      @item.valid?
      binding.pry
      expect(@item.errors.full_messages).to include('Userを入力してください')
    end
  end
end
