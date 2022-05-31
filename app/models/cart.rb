class Cart < ApplicationRecord
    # has_many :line_items, dependent: :destroy
    # has_many :phones, through: :line_items
    belongs_to :customer, optional: true
    has_and_belongs_to_many :phones
end
