class AddStockStatusIdToProducts < ActiveRecord::Migration[5.2]
  def change
    add_column :products, :stock_status_id, :integer
    add_index :products, :stock_status_id
  end
end
