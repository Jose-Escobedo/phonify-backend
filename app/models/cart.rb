class Cart < ApplicationRecord
    has_many :line_items, dependent: :delete_all

    #   def checkout
    #     if items_in_stock && cart_has_items
    #       purchase_products
    #       clear_cart
    #       return true
    #     end
    #     false
    #   end
    
      # Attempts to add an item to a cart. If the product doesn't exist
      # or the item quantity provided is invalid then an error is raised
      def add_product(phone_id, item_quantity)
        item_quantity = item_quantity.to_i
        if cart_has_item(phone_id)
          # Attempting to add an item that already exists in the cart.
          # The new quantity for the item is summed with the current item quantity
          current_item_quantity = item_quantity(phone_id)
          update_cart_item(phone_id, current_item_quantity + item_quantity)
        else
        #   # Attempting to add new item to cart
        #   validate_item_in_stock(product_id, item_quantity)
    
          line_items.create!(phone_id: phone_id, quantity: item_quantity)
        end
      end
    
      # Attempts to update the quantity of an item in the cart.
      # If the item doesn't exist or the item quantity is invalid
      # then an error is raised
      def update_cart_item(phone_id, item_quantity)
        item_quantity = item_quantity.to_i
        validate_cart_item(phone_id)
    
        line_item = line_items.find_by!(phone_id: phone_id.to_i)
        line_item.update!(quantity: item_quantity)
      end
    
      # Calculates the subtotal for all the items in the cart
    #   def calculate_subtotal
    #     line_items.to_a.sum(&:total)
    #   end
    
      private
    
      def clear_cart
        line_items.delete_all
      end

      # Ensures that the item exists in the cart
      def validate_cart_item(phone_id)
        line_item = line_items.find_by(phone_id: phone_id)
        raise ArgumentError, 'The item does not exist in the cart' if line_item.nil?
      end
    
      # Returns a boolean indicating whether an item already exists
      # in the cart or not. If the product doesn't exist then an error is raised
      def cart_has_item(phone_id)
        !line_items.find_by(phone_id: phone_id.to_i).nil?
      end
    
      def item_quantity(phone_id)
       line_item =line_items.find_by!(phone_id: phone_id.to_i)
       line_item.item_quantity
      end
    
      def cart_has_items
        line_items.any?
      end
    
      # Returns a boolean indicating whether all the items in the cart
      # are in stock or not
    #   def items_in_stock
    #     line_items.none? { |item| item.item_quantity > item.product.inventory_count }
    #   end
end
