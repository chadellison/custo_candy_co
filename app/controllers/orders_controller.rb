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

  def create
    if current_user
    @order = Order.create(status: "pending", user_id: session[:user_id])
    prepare_order(@order, params[:contents])
    redirect_to order_success_path
    else
      flash[:notice] = "You must login or register for an account before checking out"
      redirect_to cart_path
    end
  end
end
