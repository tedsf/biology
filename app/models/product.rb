class Product < ActiveRecord::Base
  # validates :name, presence: true
  # validates :description, presence: true
  # validates :price, presence: true
  # validates :image, presence: true
  # validates :quantity, presence: true
  # validates :category_id, presence: true

  has_many :categories_products
  has_many :categories, through: :categories_products
end
