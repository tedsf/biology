class CreateCategoriesProducts < ActiveRecord::Migration
  def change
    create_table :categories_products do |t|
      t.integer :category_id, foreign_key: true
  	  t.integer :product_id, foreign_key: true
  	  
      t.timestamps null: false
    end
  end
end
