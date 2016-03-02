class CartsController < ApplicationController
  include ActionView::Helpers::NumberHelper

  def create
    candy = Candy.find(params[:candy_id])
    @cart.add_candy(candy.id)
    session[:cart] = @cart.contents

    flash[:info] = "Cart updated with #{candy.title}"
    redirect_to candies_path
  end

  def index
    @contents = session[:cart]
  end
end
