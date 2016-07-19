class RatingsController < ApplicationController

  def index
    @rating = Rating.all
  end

  def new
    @rating = Rating.new(user_id: current_user.id, product_id: product_id, rating: params[:rating])
  end

  def create
    @rating = Rating.new(user_id: current_user.id, product_id: product_id, rating: params[:rating])

    if @rating.save
      flash[:success] = ["Your Rating has been saved! Thank you!"]
      redirect_to root_path
    else
      flash[:danger] = ["There was an error with your rating, please try again."]
      redirect_to root_path
    end
  end
end
