class Order < ApplicationRecord
    belongs_to :orderstatus
    has_many :order_item, dependent: :delete_all
end
