require 'rails_helper'
RSpec.describe 'ユーザー新規登録', type: :system do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    context '新規登録に成功する時' do
      it "入力項目が全て正しく入力された時、登録に成功する" do
        @user.valid?
      end
    end

    context '新規登録に失敗する時' do
      it "ニックネームが空欄の時、登録に失敗する" do
        @user.nickname = ""
        @user
        expect(@user.errors.full_messages).to include("NickName can't be blank")
      end

      it "メールアドレスが空欄の時、登録に失敗する" do
      end
      
    
    end

  end
end

