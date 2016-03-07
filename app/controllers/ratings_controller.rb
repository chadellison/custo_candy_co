class RatingsController < ApplicationController
  def new
    @candy = Candy.find(params[:format])
    @rating = @candy.ratings.new
  end

  def create
    Rating.create(rating: params[:rating][:rating], candy_id: params[:format])
    redirect_to candies_path
  end

  def rating_params
    params.require(:rating).permit(:rating, :format)
  end
end
