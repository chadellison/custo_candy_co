class CandiesController < ApplicationController
  def index
    @candies = Candy.all
  end

  def show
    @candy = Candy.find(params[:id])
  end

  def edit
    @candy = Candy.find(params[:id])
  end

  def update
    @candy = Candy.find(params[:id])
    rating = Rating.create(candy_id: @candy.id, rating: candy_params[:rating])
    @candy.ratings << rating
    # byebug
    # update(candy_params)
    redirect_to candies_path
  end

  private

  def candy_params
    params.require(:candy).permit(:rating)
  end
end
