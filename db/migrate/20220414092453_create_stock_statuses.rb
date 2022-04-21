class CreateStockStatuses < ActiveRecord::Migration[7.0]
  def change
    create_table :stock_statuses do |t|
      t.string :status, null: false

      t.timestamps
    end
  end
end
