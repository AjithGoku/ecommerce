class AddDiscountIdToProducts < ActiveRecord::Migration[7.0]
  def change
    add_column :products, :discount_id, :integer
    add_index :products, :discount_id
  end
end
