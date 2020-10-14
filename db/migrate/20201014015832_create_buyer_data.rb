class CreateBuyerData < ActiveRecord::Migration[6.0]
  def change
    create_table :buyer_data do |t|

      t.timestamps
    end
  end
end
