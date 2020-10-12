require 'rails_helper'
RSpec.describe 'ユーザー新規登録', type: :system do
  before do
    @user = FactoryBot.build(:user)
    @user2 = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    context '新規登録に成功する時' do
      it '入力項目が全て正しく入力された時、登録に成功する' do
        @user.valid?
      end
    end

    context '新規登録に失敗する時' do
      it 'ニックネームが空欄の時、登録に失敗する' do
        @user.nickname = ''
        @user.valid?
        expect(@user.errors.full_messages).to include('Nickname を入力してください')
      end

      it 'メールアドレスが空欄の時、登録に失敗する' do
        @user.email = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Email can't be blank")
      end

      it 'メールアドレスに＠が入っていない時、登録に失敗する' do
        @user.email = 'aaaaaagmail.com'
        @user.valid?
        expect(@user.errors.full_messages).to include('Email is invalid')
      end

      it 'メールアドレスが重複してる時、登録に失敗する' do
        @user.save
        @user2.email = @user.email
        @user2.valid?
        expect(@user2.errors.full_messages).to include('Email has already been taken')
      end

      it 'パスワードが空欄の時、登録に失敗する' do
        @user.password = ''
        @user.password_confirmation = @user.password
        @user.valid?
        expect(@user.errors.full_messages).to include("Password can't be blank")
      end

      it 'パスワードが6文字以下の時、登録に失敗する' do
        @user.password = 'a1a1a'
        @user.password_confirmation = @user.password
        @user.valid?
        expect(@user.errors.full_messages).to include('Password is too short (minimum is 6 characters)')
      end

      it 'パスワードが英字のみの時、登録に失敗する' do
        @user.password = 'aaaaaa'
        @user.password_confirmation = @user.password
        @user.valid?
        expect(@user.errors.full_messages).to include('Password は英字と数字の両方を含めて設定してください')
      end

      it 'パスワードが数字のみの時、登録に失敗する' do
        @user.password = '111111'
        @user.password_confirmation = @user.password
        @user.valid?
        expect(@user.errors.full_messages).to include('Password は英字と数字の両方を含めて設定してください')
      end

      it 'パスワード(確認)が一致しない時、登録に失敗する' do
        @user.password_confirmation = '1a1a1a'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end

      it '名前(姓)が文字が半角文字の時、登録できない' do
        @user.last_name = 'a'
        @user.valid?
        expect(@user.errors.full_messages).to include('Last name は全角文字を使用してください')
      end

      it '名前(名)が半角文字の時、登録できない' do
        @user.first_name = 'a'
        @user.valid?
        expect(@user.errors.full_messages).to include('First name は全角文字を使用してください')
      end

      it '名前カナ(姓)が半角文字の時、登録できない' do
        @user.last_name_kana = 'a'
        @user.valid?
        expect(@user.errors.full_messages).to include('Last name kana は全角カタカナを使用してください')
      end

      it '名前カナ(名)が半角文字の時、登録できない' do
        @user.first_name_kana = 'a'
        @user.valid?
        expect(@user.errors.full_messages).to include('First name kana は全角カタカナを使用してください')
      end

      it '名前カナ(姓)が全角且つカタカナでは無い時、登録できない' do
        @user.last_name_kana = 'あ'
        @user.valid?
        expect(@user.errors.full_messages).to include('Last name kana は全角カタカナを使用してください')
      end

      it '名前カナ(名)が全角且つカタカナでは無い時、登録できない' do
        @user.first_name_kana = 'あ'
        @user.valid?
        expect(@user.errors.full_messages).to include('First name kana は全角カタカナを使用してください')
      end

      it '名前(姓)が空欄の時、登録できない' do
        @user.last_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include('Last name を入力してください')
      end

      it '名前(名)が空欄の時、登録できない' do
        @user.first_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include('First name を入力してください')
      end

      it '名前カナ(姓)が空欄の時、登録できない' do
        @user.last_name_kana = ''
        @user.valid?
        expect(@user.errors.full_messages).to include('Last name kana を入力してください')
      end

      it '名前カナ(名)が空欄の時、登録できない' do
        @user.first_name_kana = ''
        @user.valid?
        expect(@user.errors.full_messages).to include('First name kana を入力してください')
      end

      it '生年月日が空欄の時、登録できない' do
        @user.birthday = ''
        @user.valid?
        expect(@user.errors.full_messages).to include('Birthday を入力してください')
      end
    end
  end
end
