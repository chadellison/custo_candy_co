class RatingsController < ApplicationController
  def new
    @candy = Candy.find(params[:candy_id])
    @rating = @candy.ratings.new
  end

  def create
    Rating.create(rating_params)
    redirect_to candies_path
  end

  def rating_params
    params.require(:rating).permit(:rating, :candy_id)
  end
end
