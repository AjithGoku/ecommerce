class CreateOrderstatuses < ActiveRecord::Migration[7.0]
  def change
    create_table :orderstatuses do |t|
      t.string :order_status

      t.timestamps
    end
  end
end
