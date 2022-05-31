class CreateLineItems < ActiveRecord::Migration[7.0]
  def change
    create_table :line_items do |t|
      t.integer :quantity
      t.integer :phone_id
      t.integer :cart_id
      t.decimal :subtotal
      t.decimal :unit_price
      t.decimal :total
      t.timestamps
    end
  end
end