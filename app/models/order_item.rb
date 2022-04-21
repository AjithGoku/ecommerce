class OrderItem < ApplicationRecord
    validates :actual_price, presence: true, numericality: {:greater_than => 0}   
    validates :discount_price, presence: true, numericality: {:greater_than => 0} 
    validates :quantity, presence: true     
  
    belongs_to :order
    belongs_to :product
end
