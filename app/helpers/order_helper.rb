module OrderHelper

  def product_uniqueness(potential_order)
    cart = Order.where(user_id: current_user.id, purchased: false)
    if cart == []
      return true
    else
      cart.each do |order|
        if order.product_id == potential_order.product_id
          return false
        end
      end
    end
    return true
  end

end
