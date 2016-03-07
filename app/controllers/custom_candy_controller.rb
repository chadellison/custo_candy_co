class CustomCandyController < ApplicationController
  def new
    @category = Category.all
  end

  def create
    byebug
  end
end
