class CartsController < ApplicationController
  include ActionView::Helpers::NumberHelper
  include CartsHelper

  def create
    byebug
    if request.referrer.include?("custom_candies")
      candy = CustomCandy.find(params[:id])
      @cart.add_candy(candy.id, "custom")
    else
      candy = Candy.find(params[:candy_id])
      @cart.add_candy(candy.id, "candy")
      session[:cart] = @cart.contents
    end
    flash[:info] = "Cart updated with #{path(candy)}"
    redirect_to :back
  end

  def show
  end

  def update
    candy = Candy.find(params[:candy_id])
    @cart.adjust_quantity(params[:operator], candy.id)

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
