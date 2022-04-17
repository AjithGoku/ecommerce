class AddDiscountIdToProducts < ActiveRecord::Migration[5.2]
  def change
    add_column :products, :discount_id, :integer
    add_index :products, :discount_id
  end
end
