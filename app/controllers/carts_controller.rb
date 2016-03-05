class CartsController < ApplicationController
  include ActionView::Helpers::NumberHelper
  include CartsHelper

  def create
    candy = Candy.find(params[:candy_id])
    @cart.add_candy(candy.id)
    session[:cart] = @cart.contents

    flash[:info] = "Cart updated with #{candy.title}"
    redirect_to :back
  end

  def show
    @candies = @cart.find_candies(@cart.contents)
  end

  def update
    contents = @cart.contents
    candy = Candy.find(params[:candy_id])

    if params[:operator] == "-"
      contents[params["candy_id"]] -= 1
      contents[params["candy_id"]] = 0 if contents[params["candy_id"]] < 0
    else
      contents[params["candy_id"]] += 1
    end
    flash[:success] = "Quantity for #{candy.title} has been changed"
    redirect_to cart_path
  end

  def destroy
    candy = Candy.find(params[:candy_id])
    @cart.remove_candy(candy)
    flash[:success] = "Successfully removed #{path(candy)} from your cart."
    redirect_to cart_path
  end
end
