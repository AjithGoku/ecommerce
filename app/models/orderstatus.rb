class Orderstatus < ApplicationRecord
    validates :name, presence: true     
    has_many :order, dependent: :delete_all
end
