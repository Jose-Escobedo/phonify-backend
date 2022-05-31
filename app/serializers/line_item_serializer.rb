class LineItemSerializer < ActiveModel::Serializer
  attributes :id, :phone_id, :quantity, :total, :unit_price
end
