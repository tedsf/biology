class OrdersController < ApplicationController
  # User's history (purchased products)
  def index
    @orders = current_user.orders.where(purchased: true)
  end

  # User's AJAX cart view (unpurchased products)
  def show
    @orders = Order.where(purchased: false)
  end

  # FUNKY: This action may be unnecessary
  def new
    @order = Order.new(user_id: current_user.id, product_id: params[:product_id])
  end

  # Adding product to cart for real (unpurchased products)
  def create
    z = params[:product_id]
    @order = Order.new(user_id: current_user.id, product_id: z.keys[0].to_i, quantity: params[:order][:quantity])
    if @order.save
      redirect_to root_path
    else
      flash[:error] = 'We have no clue what you did wrong!'
    end
  end

  # User's full-page cart view (unpurchased products)
  def edit
    @orders = Order.where(purchased: false)
  end

  # Edit and/or checkout (unpurchased products may become purchased)
  def update
    # Update cart button via AJAX
    if request.xhr?
      @order.update(order_params)
      # AJAX magic
    # Checkout button via http
    else
      @orders = Order.where(purchased: false)
      @orders.each do |order|
        order.purchased = true
      SignupMailer.checkout_email(current_user).deliver
      end
    end
  end

  # Remove products from cart (unpurchased products)
  def destroy
    @order = Order.find(params[:id])
    @order.destroy
    redirect_to user_order_path
  end

# FUNKY: We're only letting the user edit quantity.
# private
# def order_params
#   params.require(:order).permit(:quantity)
# end

end
