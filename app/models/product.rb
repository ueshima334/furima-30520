class Product < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions

  belongs_to :user
  belongs_to_active_hash :category
  belongs_to_active_hash :status
  belongs_to_active_hash :delivery_charge
  belongs_to_active_hash :area
  belongs_to_active_hash :days

  validates :title,              presence: true
  validates :details,            presence: true
  validates :category_id,        presence: true
  validates :status_id,          presence: true
  validates :delivery_charge_id, presence: true
  validates :area_id,            presence: true
  validates :days_id,            presence: true
  validates :price,              presence: true

end
