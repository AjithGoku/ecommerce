class Product < ApplicationRecord
    validates :name, presence: true
    validates :price, presence: true, numericality: {:greater_than => 0}   
    validates :description, presence: true 
    belongs_to :product_category
    belongs_to :stock_status
    belongs_to :discount
    has_many :order_item
    validates :product_category, presence: true
    validates :stock_status, presence: true  
    validates_associated :order_item
end
