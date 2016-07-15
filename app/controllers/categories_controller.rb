class CategoriesController < ApplicationController
  def show
    product_query = CategoriesProduct.where(category_id: params[:id])

    p product_query.many?
    if product_query.many?
      relationships = product_query
      relationships.each do |relationship|
        @products = []
        @products.push(Product.find(relationship.product_id))
      end
    else
      relationship = product_query[0]
      @product = Product.find(relationship.product_id)
    end
  end
end
