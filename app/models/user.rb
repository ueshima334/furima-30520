class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :products

  validates :nickname,        presence: { message: 'を入力してください' }
  validates :birthday,        presence: { message: 'を入力してください' }
  validates :password,        format: { with: /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i, message: 'は英字と数字の両方を含めて設定してください' }

  with_options presence: { message: 'を入力してください' }, format: { with: /\A[ぁ-んァ-ン一-龥]+\z/, message: 'は全角文字を使用してください' } do
    validates :last_name
    validates :first_name
  end

  with_options presence: { message: 'を入力してください' }, format: { with: /\A[\p{katakana}\p{blank}ー－]+\z/, message: 'は全角カタカナを使用してください' } do
    validates :last_name_kana
    validates :first_name_kana
  end

end
