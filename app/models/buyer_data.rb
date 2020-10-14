class BuyerData < ApplicationRecord
  belongs_to :buyer,optional: true
  accepts_nested_attributes_for :buyer

  with_options presence: { message: 'を入力してください' } do
    validates :postal_code
    validates :city
    validates :address
    validates :building
    validates :phone_number 
  end
    validates :prefecture_id,numericality: { other_than: 1, message: 'を入力してください' } 
end
