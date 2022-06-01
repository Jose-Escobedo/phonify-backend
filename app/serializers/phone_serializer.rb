class PhoneSerializer < ActiveModel::Serializer
    attributes :name, :desc, :id, :image, :price, :quantity
  end
  