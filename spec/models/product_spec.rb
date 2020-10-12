require 'rails_helper'
RSpec.describe '出品商品の登録', type: :system do
  before do
    @product = FactoryBot.build(:product)
  end

  describe '出品商品の登録' do
    context '登録に成功する時' do
      it '入力項目が全て正しく入力された時、登録に成功する' do
        @product.valid?
      end
    end

    context '登録に失敗する時' do
      it '商品画像が空の時、登録に失敗する' do
        @product.image = nil
        @product.valid?
        expect(@product.errors.full_messages).to include("Image を選択してください") 
      end
      
      it '商品名が空の時、登録に失敗する' do
        @product.title = ""
        @product.valid?
        expect(@product.errors.full_messages).to include("Title を入力してください") 
      end

      it '商品の説明が空の時、登録に失敗する' do
        @product.details = ""
        @product.valid?
        expect(@product.errors.full_messages).to include("Details を入力してください") 
      end

      it 'カテゴリーが空(「---」を選択)の時、登録に失敗する' do
        @product.category_id = 1
        @product.valid?
        expect(@product.errors.full_messages).to include("Category を入力してください") 
      end

      it '商品の状態が空(「---」を選択)の時、登録に失敗する' do
        @product.status_id = 1
        @product.valid?
        expect(@product.errors.full_messages).to include("Status を入力してください") 
      end

      it '配送料の負担が空(「---」を選択)の時、登録に失敗する' do
        @product.delivery_charge_id = 1
        @product.valid?
        expect(@product.errors.full_messages).to include("Delivery charge を入力してください") 
      end

      it '発送元の地域が空(「---」を選択)の時、登録に失敗する' do
        @product.area_id = 1
        @product.valid?
        expect(@product.errors.full_messages).to include("Area を入力してください") 
      end

      it '発送までの日数が空(「---」を選択)の時、登録に失敗する' do
        @product.days_id = 1
        @product.valid?
        expect(@product.errors.full_messages).to include("Days を入力してください") 
      end

      it '価格が空の時、登録に失敗する' do
        @product.price = ""
        @product.valid?
        expect(@product.errors.full_messages).to include("Price を入力してください") 
      end

      it '価格が300より小さい値の時、登録に失敗する' do
        @product.price = 299
        @product.valid?
        expect(@product.errors.full_messages).to include("Price は300~9999999の範囲で指定してください") 
      end

      it '価格が9999999より大きい値の時、登録に失敗する' do
        @product.price = 10000000
        @product.valid?
        expect(@product.errors.full_messages).to include("Price は300~9999999の範囲で指定してください") 
      end

      it '価格が全角数字の時、登録に失敗する' do
        @product.price = '３００'
        @product.valid?
        expect(@product.errors.full_messages).to include("Price は半角数字で入力してください") 
      end
    end
  end
end