class ReviewsController < ApplicationController
  def new
    @candy = Candy.find(params[:candy_id])
    @review = @candy.reviews.new
  end

  def create
    Review.create(review_params)
    redirect_to candies_path
  end

private

  def review_params
    params.require(:review).permit(:name, :rating, :review, :candy_id)
  end

  def get_candy_id
    params[:review][:candy_id]
  end
end
