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
    product_id = params[:product_id].keys[0].to_i
    @order = Order.new(user_id: current_user.id, product_id: product_id, quantity: params[:order][:quantity])
    if @order.save
      redirect_to root_path
    else
      flash[:danger] = @order.errors.full_messages
      redirect_to "/products/#{product_id}"
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
        # Set the order to purchased.
        order.update(purchased: true)

        # Update product stock quantity accordingly.
        product = Product.find(order.product_id)
        product.update(quantity: (product.quantity -= order.quantity))
      end

      # Email user checkout confirmation/receipt.
      SignupMailer.checkout_email(current_user).deliver

      render "thank_you.html.haml"
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
