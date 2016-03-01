class CandiesController < ApplicationController

  def index
    @candies = Candy.all
  end

end
