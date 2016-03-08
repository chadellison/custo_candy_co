class CustomCandyController < ApplicationController
  def new
    @custom_candy = CustomCandy.new
  end

  def create
    @custom_candy = CustomCandy.create(custom_candy_params)
    redirect_to custom_candies(@custom_candy)
  end

  def show
    @custom_candy = CustomCandy.find
  end

  private

  def custom_candy_params
    params.require(:custom_candy).permit(:category, :fillings)
  end
end
