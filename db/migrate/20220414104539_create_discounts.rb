class CreateDiscounts < ActiveRecord::Migration[7.0]
  def change
    create_table :discounts do |t|
      t.decimal :percentage, null: false

      t.timestamps
    end
  end
end
