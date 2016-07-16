class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      t.integer :user_id
      t.integer :product_id
      t.boolean :purchased
      t.integer :quantity
      t.integer :order_price

      t.timestamps null: false
    end
  end
end
