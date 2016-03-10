class CartsController < ApplicationController
  include ActionView::Helpers::NumberHelper
  include CartsHelper

  def create
    if request.referrer.include?("custom_candies")
      candy = CustomCandy.find(params[:id])
      @cart.add_candy(candy.id, "custom")
    else
      candy = Candy.find(params[:candy_id])
      @cart.add_candy(candy.id, "candy")
    end
    session[:cart] = @cart.contents
    flash[:info] = "Cart updated with #{path(candy)}"
    redirect_to :back
  end

  def show
  end

  def update
    if params[:custom_id]
      candy = CustomCandy.find(params[:custom_id])
    else
      candy = Candy.find(params[:candy_id])
    end
    @cart.adjust_quantity(params[:operator], candy)
    flash[:success] = "Quantity for #{path(candy)} has been changed"
    redirect_to cart_path
  end

  def destroy
    if params[:custom_id]
      candy = CustomCandy.find(params[:custom_id])
    else
      candy = Candy.find(params[:candy_id])
    end
    @cart.remove_candy(candy)
    flash[:success] = "Successfully removed #{path(candy)} from your cart."
    redirect_to cart_path
  end
end
