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
      @order = current_user.orders.create(status: "pending")
      if params[:contents]["candy"] && params[:contents]["custom"]
        cart_params = {}
        cart_params["candy"] = params[:contents]["candy"]
        cart_params["custom"] = params[:contents]["custom"]
        @cart = Cart.new(cart_params)
      elsif params[:contents]["candy"]
        @cart = Cart.new(params[:contents]["candy"])
      else
        @cart = Cart.new(params[:contents]["custom"])
      end
      OrderProcessor.new(@order, @cart).prepare_order
      session[:cart] = {}
      redirect_to order_success_path
    else
      flash[:notice] = "You must login or register for an account before checking out"
      redirect_to cart_path
    end
  end
end
