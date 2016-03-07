class OrdersController < ApplicationController
  include ActionView::Helpers::NumberHelper

  def index
    @user = User.find_by(id: session[:user_id])
    @orders = @user.orders
  end

  def show
    @order = Order.find(params[:id])
    @candy_orders = @order.candy_orders
  end

  def create
    if current_user
    @order = Order.create(status: "pending", user_id: session[:user_id])
    @cart = Cart.new(params[:contents])
    OrderProcessor.new(@order, @cart).prepare_order
    session[:cart] = {}
    redirect_to order_success_path
    else
      flash[:notice] = "You must login or register for an account before checking out"
      redirect_to cart_path
    end
  end
end
