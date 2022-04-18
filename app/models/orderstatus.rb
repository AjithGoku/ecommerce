class Orderstatus < ApplicationRecord
    has_many :order, dependent: :delete_all
end
