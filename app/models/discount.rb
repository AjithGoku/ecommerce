class Discount < ApplicationRecord
    #validates :percentage, presence: true
    has_many :products
end
