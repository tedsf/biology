class Order < ActiveRecord::Base
  belongs_to :product
  belongs_to :user

  before_create :order_price


  # Validation for order quantity not exceeding product quantity.
  # Callback for calculating order_price
  def order_price
    self.order_price = (self.product.price * self.quantity * 100).round / 100.0
  end
end
