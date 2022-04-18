class CreateProducts < ActiveRecord::Migration[7.0]
  def change
    create_table :products do |t|
      t.string :name
      t.text :description
      t.decimal :price
      t.string :image_url
      t.integer :discount_id
      t.integer :product_category_id
      t.integer :stock_status_id

      t.timestamps
    end
  end
end
