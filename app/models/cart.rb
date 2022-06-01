class Cart < ApplicationRecord
    has_many :line_items, dependent: :delete_all
    has_many :phones, through: :line_items

    # def add_product(phone_id, item_quantity)
    #     item_quantity = item_quantity.to_i
    #     if cart_has_item(phone_id)
    #       # Attempting to add an item that already exists in the cart.
    #       # The new quantity for the item is summed with the current item quantity
    #       current_item_quantity = item_quantity(phone_id)
    #       update_cart_item(product_id, current_item_quantity + quantity)
    #     else
    #       line_items.create!(phone_id: phone_id, quantity: quantity)
    #     end
    # end

    # def update_cart_item(phone_id, item_quantity)
    #     item_quantity = item_quantity.to_i
    #     cart_item = cart_items.find_by!(phone_id: phone_id.to_i)
    #     cart_item.update!(item_quantity: item_quantity)
    # end

    # def cart_has_item(phone_id)
    #     !line_items.find_by(phone_id: phone_id.to_i).nil?
    # end

    # def item_quantity(product_id)
    #     line_item = line_items.find_by!(phone_id: phone_id.to_i)
    #     line_item.item_quantity
    # end
end
