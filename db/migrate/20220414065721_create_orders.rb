class CreateOrders < ActiveRecord::Migration[7.0]
  def change
    create_table :orders do |t|
      t.integer :customer_id
      t.float :total_price
      t.integer :orderstatus_id

      t.timestamps
    end
  end
end
