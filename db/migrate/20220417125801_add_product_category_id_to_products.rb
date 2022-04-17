class AddProductCategoryIdToProducts < ActiveRecord::Migrationv[7.0]
  def change
    add_column :products, :product_category_id, :integer
    add_index :products, :product_category_id
  end
end
