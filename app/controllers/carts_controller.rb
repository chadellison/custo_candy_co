class CartsController < ApplicationController
  include ActionView::Helpers::NumberHelper
  include CartsHelper

  def create
    candy = Candy.find(params[:candy_id])
    @cart.add_candy(candy.id)
    session[:cart] = @cart.contents

    flash[:info] = "Cart updated with #{path(candy)}"
    redirect_to :back
  end

  def show
    @candies = @cart.find_candies(@cart.contents)
  end

  def update
    candy = Candy.find(params[:candy_id])

    adjust_quantity(params[:operator])

    flash[:success] = "Quantity for #{path(candy)} has been changed"
    redirect_to cart_path
  end

  def destroy
    candy = Candy.find(params[:candy_id])
    @cart.remove_candy(candy)
    flash[:success] = "Successfully removed #{path(candy)} from your cart."
    redirect_to cart_path
  end
end
