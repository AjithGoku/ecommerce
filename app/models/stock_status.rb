class StockStatus < ApplicationRecord
    validates :status, presence: true 
    has_many :products
end
