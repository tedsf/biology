class ProductsController < ApplicationController
  def index
    @products = Product.all
    @categories = Category.all
    @rating = Rating.all

  end

  def show
    find_product
    @rating = Rating.all
  end

private
  def find_product
    @product = Product.find(params[:id])
  end
end
