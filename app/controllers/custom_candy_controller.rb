class CustomCandyController < ApplicationController
  def new
    @category = Category.all
  end

  def create
  end
end
