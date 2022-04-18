class CreateOrderItems < ActiveRecord::Migration[7.0]
  def change
    create_table :order_items do |t|
      t.integer :order_id
      t.integer :product_id
      t.float :actual_price
      t.float :discount_price
      t.float :final_price
      t.integer :quantity

      t.timestamps
    end
  end
end
