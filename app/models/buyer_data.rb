class BuyerData < ApplicationRecord
  belongs_to :buyer,optional: true
  accepts_nested_attributes_for :buyer

  attr_accessor :token

  with_options presence: { message: 'を入力してください' } do
    validates :postal_code,format: { with: /\A\d{3}[-]\d{4}\z/, message: 'はハイフン込み7桁の数字を入力してください' }
    validates :city
    validates :address
    validates :phone_number 
  end
    validates :prefecture_id,numericality: { other_than: 1, message: 'を入力してください' } 

    validates :token, presence: { message: 'クレジットカードの情報を正しく入力してください' } 
end
