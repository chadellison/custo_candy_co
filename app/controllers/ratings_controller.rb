class RatingsController < ApplicationController
  def new
    @candy = Candy.find(params[:format])
    @rating = @candy.ratings.create
  end

  def update
    rating = Rating.last
    rating.update(rating: rating_params[:rating])
    redirect_to candies_path
  end

  def rating_params
    params.require(:rating).permit(:rating)
  end
end
