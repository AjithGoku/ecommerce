class Product < ApplicationRecord
    validates :name, presence: true   
    validates :price, presence: true, numericality: {:greater_than => 0}   
    validates :description, presence: true 
    belongs_to :product_category
    belongs_to :stock_status
    belongs_to :discount
end
