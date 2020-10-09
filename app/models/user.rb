class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

         validates :nickname,        presence: { message: "名前を入力してください" }
         validates :birthday,        presence: { message: "生年月日を入力してください" }
         validates :password,        presence: true, format: { with: /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i, message: '英字と数字の両方を含めて設定してください' }

         with_options presence: { message: "名前を入力してください" }, format: { with: /\A[ぁ-んァ-ン一-龥]+\z/, message: '全角文字を使用してください' } do
          validates :last_name
          validates :first_name
          validates :last_name_kana
          validates :first_name_kana
        end
end
