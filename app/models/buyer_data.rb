class BuyerData < ApplicationRecord
  belongs_to :buyer, optional: true
  accepts_nested_attributes_for :buyer

  attr_accessor :token

  with_options presence: { message: 'を入力してください' } do
    validates :postal_code, format: { with: /\A\d{3}[-]\d{4}\z/, message: 'はハイフン込み7桁の数字を入力してください' }
    validates :city
    validates :address
    validates :phone_number,format:{ with:/\A[0-9]+\z/,message: 'は半角数字のみで入力してください' },length:{ maximum: 11 , message: 'は11桁以内で入力してください' }
  end
  validates :prefecture_id, numericality: { other_than: 1, message: 'を入力してください' }

  validates :token, presence: { message: 'クレジットカードの情報を正しく入力してください' }
 
  def self.buyer_save(buyer)
    buyer.save
  end

  def self.buyerdata_save(buyerdata)
    buyerdata.save
  end

end
