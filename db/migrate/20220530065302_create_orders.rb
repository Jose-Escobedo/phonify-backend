class CreateOrders < ActiveRecord::Migration[7.0]
  def change
    create_table :orders do |t|
      t.string :name
      t.string :email
      t.text :address
      t.text :phone_num

      t.timestamps
    end
  end
end
