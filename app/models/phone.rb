class Phone < ApplicationRecord
    has_many :line_items, dependent: :destroy
end
