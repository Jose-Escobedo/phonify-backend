class LineItem < ApplicationRecord
    belongs_to :phone
    belongs_to :order
    belongs_to :cart
end
