class Orderstatus < ApplicationRecord
    validates :order_status, presence: true
    has_many :order, dependent: :delete_all
en