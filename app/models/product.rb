class Product < ApplicationRecord
  belongs_to :user
  belongs_to_active_hash :category
  belongs_to_active_hash :status
  belongs_to_active_hash :delivery_charge
  belongs_to_active_hash :area
  belongs_to_active_hash :days

  validats :title,              presence: true
  validats :details,            presence: true
  validats :category_id,        presence: true
  validats :status_id,          presence: true
  validats :delivery_charge_id, presence: true
  validats :area_id,            presence: true
  validats :days_id,            presence: true
  validats :price,              presence: true

end
