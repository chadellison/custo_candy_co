class OrdersController < ApplicationController
  def index
    @user = User.find_by(id: session[:user_id])
    @orders = @user.orders
  end

  def show
    @order = Order.find(params[:id])
    @candy_orders = @order.candy_orders
    @total_price = CandyOrder.total_price(@candy_orders)
  end
end