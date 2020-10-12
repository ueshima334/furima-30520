class Product < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions

  belongs_to :user
  belongs_to_active_hash :category
  belongs_to_active_hash :status
  belongs_to_active_hash :delivery_charge
  belongs_to_active_hash :area
  belongs_to_active_hash :days
  has_one_attached :image

  with_options numericality: { other_than: 1, message: 'を入力してください' } do
    validates :category_id
    validates :status_id
    validates :delivery_charge_id
    validates :area_id
    validates :days_id
  end

  with_options presence: { message: 'を入力してください' } do
    validates :title
    validates :details
    validates :price
  end

  validates :image,   presence: { message: 'を選択してください' }
  validates :price,   numericality: { message: 'は半角数字で入力してください' }, allow_blank: true
  validates :price,   numericality: { greater_than_or_equal_to: 300, message: 'は300~9999999の範囲で指定してください',
                                      less_than_or_equal_to: 9_999_999, message: 'は300~9999999の範囲で指定してください' }, allow_blank: true
end
