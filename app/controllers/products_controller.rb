class ProductsController < ApplicationController
  def index
    @products = Product.all
    @categories = Category.all
  end

  def show
    find_product
  end

private
  def find_product
    @product = Product.find(params[:id])
  end
end
