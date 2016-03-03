class CandiesController < ApplicationController
  def index
    @candies = Candy.all
  end

  def show
  end
end
