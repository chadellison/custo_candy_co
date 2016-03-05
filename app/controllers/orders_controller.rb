class OrdersController < ApplicationController
  def index
    @user = User.find_by(id: session[:user_id])
    @orders = @user.orders
    byebug
  end

end
