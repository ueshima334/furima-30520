require 'rails_helper'
RSpec.describe '出品商品の登録', type: :system do
  before do
    @buyerdata = FactoryBot.build(:BuyerData)
  end

  describe '購入者情報の入力' do
    context '購入に成功する時' do
      it '入力項目が全て正しく入力された時、登録に成功する' do
        @buyerdata.valid?
      end
    end
    context '購入に失敗する時' do
      it '郵便番号が空の時、購入に失敗する' do
        @buyerdata.postal_code = ''
        @buyerdata.valid?
        expect(@buyerdata.errors.full_messages).to include('Postal code を入力してください')
      end

      it '郵便番号にハイフンが含まれていない時、購入に失敗する' do
        @buyerdata.postal_code = '1111111'
        @buyerdata.valid?
        expect(@buyerdata.errors.full_messages).to include('Postal code はハイフン込み7桁の数字を入力してください')
      end

      it '都道府県が空(「---」を選択)の時、購入に失敗する' do
        @buyerdata.prefecture_id = 1
        @buyerdata.valid?
        expect(@buyerdata.errors.full_messages).to include('Prefecture を入力してください')
      end

      it '市区町村が空の時、購入に失敗する' do
        @buyerdata.city = ''
        @buyerdata.valid?
        expect(@buyerdata.errors.full_messages).to include('City を入力してください')
      end

      it '番地が空の時、購入に失敗する' do
        @buyerdata.address = ''
        @buyerdata.valid?
        expect(@buyerdata.errors.full_messages).to include('Address を入力してください')
      end

      it '電話番号が空の時、購入に失敗する' do
        @buyerdata.phone_number = ''
        @buyerdata.valid?
        expect(@buyerdata.errors.full_messages).to include('Phone number を入力してください')
      end

      it 'クレジットカードの情報が保存されていない時、購入に失敗する' do
        @buyerdata.token = ''
        @buyerdata.valid?
        expect(@buyerdata.errors.full_messages).to include('Token クレジットカードの情報を正しく入力してください')
      end
    end
  end
end
