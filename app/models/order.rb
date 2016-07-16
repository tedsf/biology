class Order < ActiveRecord::Base
  belongs_to :product
  belongs_to :user

  before_create :order_price

  validate :quantity_in_stock

  def order_price
    self.order_price = (self.product.price * self.quantity * 100).round / 100.0
  end

  private
  def quantity_in_stock
    if self.quantity > self.product.quantity
      errors.add(:quantity, "can't be greater than the quantity in stock")
    end
  end
end
