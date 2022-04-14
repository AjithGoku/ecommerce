class AddOrderstatusIdToOrder < ActiveRecord::Migration[7.0]
  def change
    add_column :orders, :orderstatus_id, :integer
    add_index :orders, :orderstatus_id
  end
end
