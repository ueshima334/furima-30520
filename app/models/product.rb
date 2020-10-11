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
  validates :price,              numericality: { message: 'は半角数字で入力してください' }
  validates :price,              presence: { message: 'を入力してください'},
    numericality: { greater_than_or_equal_to: 300, message: 'は300~9999999の範囲で指定してください',less_than_or_equal_to: 9999999, message: 'は300~9999999の範囲で指定してください'}
  validates :image,              presence: { message: 'を選択してください'}

end
