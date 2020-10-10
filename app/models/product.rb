class Product < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions

  belongs_to :user
  belongs_to_active_hash :category
  belongs_to_active_hash :status
  belongs_to_active_hash :delivery_charge
  belongs_to_active_hash :area
  belongs_to_active_hash :days
  has_one_attached :image

  validates :title,              presence: { message: 'を入力してください' }
  validates :details,            presence: { message: 'を入力してください' }
  validates :category_id,        numericality: { other_than: 1,message: 'を入力してください' }
  validates :status_id,          numericality: { other_than: 1,message: 'を入力してください' }
  validates :delivery_charge_id, numericality: { other_than: 1,message: 'を入力してください' }
  validates :area_id,            numericality: { other_than: 1,message: 'を入力してください' }
  validates :days_id,            numericality: { other_than: 1,message: 'を入力してください' }
  validates :price,              presence: { message: 'を入力してください' }

end
