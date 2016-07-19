class CreateRatings < ActiveRecord::Migration
  def change
    create_table :ratings do |t|
      t.integer :product_id, presence: true
      t.integer :user_id, presence: true
      t.integer :rating

      t.timestamps null: false
    end
  end
end
