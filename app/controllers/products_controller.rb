require 'statistics2'
class ProductsController < ApplicationController
  def index
    @products = Product.all
    @categories = Category.all
  end

  def show
    find_product
    find_rating

    @average_rating = @product.ratings.average(:rating).round(2)
    # @average_rating2 = (ci_lower_bound(8, 10, 0.95)* 100).round(2)
    @average_rating2 = (ci_lower_bound(@product.positive_ratings, @rating.length, 0.95)* 100).round(2)
  end


private
  def ci_lower_bound(pos, n, confidence)
    if n == 0
        return 0
    end
    z = Statistics2.pnormaldist(1-(1-confidence)/2)
    phat = 1.0*pos/n
    (phat + z*z/(2*n) - z * Math.sqrt((phat*(1-phat)+z*z/(4*n))/n))/(1+z*z/n)
  end

  def find_product
    @product = Product.find(params[:id])
  end

  def find_rating
    @rating = Rating.where(product_id: params[:id]).inspect
  end
end
