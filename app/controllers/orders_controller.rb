class OrdersController < ApplicationController
  def index
    # @orders = Order.where(user_id: current_user.id)
  end

#   #this should probably use something like:
#   # @orders = nil
#   # Order.where(user_id: current_user.id).each do |order|
#   #     if order.created_at > @orders
#   #Ummmm.....that doesn't work.  I have no idea how to implement this logic.
  def show
    @orders = Order.where(purchased: false)
  end

#   #Not sure how to implement order price here
#   #also, I put in arbitrary param names
#   def new
#     # @order = Order.new(user_id: current_user.id, product_id: params[:product_id], purchased: false, quantity: params[:quantity], order_price: #??????)
#   end

#   #same thing about params here as I mentioned on lines 14-15
#   def create
#     # @order = Order.new(user_id: current_user.id, product_id: params[:product_id], purchased: false, quantity: params[:quantity], order_price: #??????)
#     if @order.save
#       redirect_to #???
#     else
#       redirect_to #???
#     end
#   end

#   #This will use the same logic as the show route
#   def edit
#     # @order = Order.where(#??????)
#   end

#   #This will also use the same logic as show and edit
  def update
      #Here's that logic, a:
      # @order = Order.where()

      #Also, threw in some arbitrary params below
      # savesuccess = @order.update(user_id: current_user.id, product_id: params[:product_id], purchased: false, quantity: params[:quantity], order_price: #??????)
      # if savesuccess
      #   redirect_to #????
      # else
      #   redirect_to #????
      # 

      #Need a hidden field in the button to purchase to be able to hit this if statement
      if @purchase 
        @orders = Order.where(order_params)
        @orders.each do |order|
          order.purchased = true
        end
      elsif savesuccess
      else
      end
  end

#   #We will only use this route when a user wants to cancel an order they've been working on
#   #this should be something like:
#   #@order = Order.where(user_id: current_user.id).last
#   #This logic isn't fully accurate though, because what if there are two different products with their
#   #own orders (two different order_ids)?
#   def destroy
#   end

private
def order_params
  params.require(:order).permit(:user_id, :product_id, :purchased, :quantity, :order_price)
end

end
