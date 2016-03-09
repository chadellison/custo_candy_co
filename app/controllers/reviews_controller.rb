class ReviewsController < ApplicationController
  def new
    @candy = Candy.find(params[:candy_id])
    @rating = @candy.reviews.new
  end

  def create
    Review.create(review_params)
    redirect_to candies_path
  end

  def review_params
    params.require(:review).permit(:name, :rating, :review, :candy_id)
  end
end
