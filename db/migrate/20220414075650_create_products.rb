class CreateProducts < ActiveRecord::Migration[7.0]
  def change
    create_table :products do |t|
      t.string :name, null: false
      t.text :description, null: false
      t.decimal :price, null: false
      t.string :image_url, null: false
      t.integer :discount_id
      t.integer :product_category_id, null: false
      t.integer :stock_status_id, null: false

      t.timestamps
    end
  end
end
