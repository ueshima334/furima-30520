class CreateProducts < ActiveRecord::Migration[6.0]
  def change
    create_table :products do |t|

      t.timestamps
      t.string     :title,              null: false
      t.text       :details,            null: false
      t.integer    :category_id,        null: false
      t.integer    :status_id,          null: false
      t.integer    :delivery_charge_id, null: false
      t.integer    :area_id,            null: false
      t.integer    :days_id,            null: false
      t.integer    :price,              null: false
      t.references :user,               foreign_key: true
    end
  end
end
