class ProductsController < ApplicationController
  http_basic_authenticate_with name: "admin", password: "secret", except: [:index, :show]
  before_action :find_product, only: [:show, :edit, :update, :destroy]

  def index
    @products = Product.all
      if @products
        flash[:success] = "These cute babies need a home!"
      else
        flash[:danger] = "No more pets! Check back soon!"
      end
  end

  def show
    find_product
  end

  def new
    @product = Product.new()
  end

  def create
    @product = Product.new(product_params)
    if @product.save
      redirect_to root_path
    else
      redirect_to 'products/new'
    end
  end

  def edit
    find_product
  end

  def update
    find_product
    successful_save = @product.update(product_params)
    if successful_save
      redirect_to product_path(@product)
    else
      redirect_to 'edit'
    end
  end

  def destroy
    find_product.destroy
    redirect_to root_path
  end

private
  def product_params
    params.require(:product).permit(:name, :price, :description, :quantity, :image)
  end

  def find_product
    @product = Product.find(params[:id])
  end
end