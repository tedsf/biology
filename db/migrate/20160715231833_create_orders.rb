class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      t.integer :user_id, presence: true
      t.integer :product_id, presence: true
      t.boolean :purchased, default: false
      t.integer :quantity
      t.integer :order_price

      t.timestamps null: false
    end
  end
end
