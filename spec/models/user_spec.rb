require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    context '新規登録がうまくいくとき' do
      it '全ての情報が正しく入力されていれば登録できる' do
        expect(@user).to be_valid
      end
    end
    context '新規登録がうまくいかないとき' do
      it 'nicknameが空だと登録できない' do
        @user.nickname = nil
        @user.valid?
        expect(@user.errors.full_messages).to include('ニックネームを入力してください')
      end
      it 'emailが空だと登録できない' do
        @user.email = nil
        @user.valid?
        expect(@user.errors.full_messages).to include('メールアドレスを入力してください')
      end
      it 'emailには@がないと登録できない' do
        @user.email = 'email.com'
        @user.valid?
        expect(@user.errors.full_messages).to include('メールアドレスは不正な値です')
      end
      it '重複したemailが存在する場合登録できない' do
        @user.save
        another_user = FactoryBot.build(:user)
        another_user.email = @user.email
        another_user.valid?
        expect(another_user.errors.full_messages).to include('メールアドレスはすでに存在します')
      end
      it 'passwordが空だと登録できない' do
        @user.password = nil
        @user.valid?
        expect(@user.errors.full_messages).to include('パスワードを入力してください')
      end
      it 'passwordが6文字以上でないと登録できない' do
        @user.password = 'a0000'
        @user.password_confirmation = 'a0000'
        @user.valid?
        expect(@user.errors.full_messages).to include('パスワードは6文字以上で入力してください')
      end
      it 'passwordが半角英数字混合でないと登録できない' do
        @user.password = '000000'
        @user.password_confirmation = '000000'
        @user.valid?
        expect(@user.errors.full_messages).to include('パスワードを英数混合で入力してください')
      end
      it 'passwordが存在してもpassword_confirmationが空では登録できない' do
        @user.password_confirmation = ''
        @user.valid?
        expect(@user.errors.full_messages).to include('パスワード（確認用）とパスワードの入力が一致しません')
      end
      it 'passwordとpassword_confirmationが一致しないと登録できない' do
        @user.password = 'a00000'
        @user.password_confirmation = 'a000000'
        @user.valid?
        expect(@user.errors.full_messages).to include('パスワード（確認用）とパスワードの入力が一致しません')
      end
      it 'first_nameが空だと登録できない' do
        @user.first_name = nil
        @user.valid?
        expect(@user.errors.full_messages).to include('名字を入力してください')
      end
      it 'first_nameが漢字・平仮名・カタカナ以外では登録できない' do
        @user.first_name = 'suzuki'
        @user.valid?
        expect(@user.errors.full_messages).to include('名字を全角で入力してください')
      end
      it 'last_nameが空だと登録できない' do
        @user.last_name = nil
        @user.valid?
        expect(@user.errors.full_messages).to include('名前を入力してください')
      end
      it 'last_nameが漢字・平仮名・カタカナ以外では登録できない' do
        @user.last_name = 'taro'
        @user.valid?
        expect(@user.errors.full_messages).to include('名前を全角で入力してください')
      end
      it 'first_name_readingが空だと登録できない' do
        @user.first_name_reading = nil
        @user.valid?
        expect(@user.errors.full_messages).to include('名字カナを入力してください')
      end
      it 'first_name_readingが全角カタカナでないと登録できない' do
        @user.first_name_reading = '鈴木'
        @user.valid?
        expect(@user.errors.full_messages).to include('名字カナを全角で入力してください')
      end
      it 'last_name_readingが空だと登録できない' do
        @user.last_name_reading = nil
        @user.valid?
        expect(@user.errors.full_messages).to include('名前カナを入力してください')
      end
      it 'last_name_readingが全角カタカナでないと登録できない' do
        @user.last_name_reading = '太郎'
        @user.valid?
        expect(@user.errors.full_messages).to include('名前カナを全角で入力してください')
      end
      it 'birthdayが空だと登録できない' do
        @user.birthday = nil
        @user.valid?
        expect(@user.errors.full_messages).to include('生年月日を入力してください')
      end
    end
  end
end
