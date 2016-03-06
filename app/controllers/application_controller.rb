class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_action :set_cart

  helper_method :current_user, :logout

  def set_cart
    @cart = Cart.new(session[:cart])
  end

  def current_user
    @user ||= User.find_by(id: session[:user_id]) if session[:user_id]
  end

  def current_admin?
    current_user && current_user.admin?
  end

  def prepare_order(order, contents)
    contents.each do |id, quantity|
      candy = Candy.find(id)
      order.candies << candy
      update_candy_order(order, contents)
    end
  end

  def update_candy_order(order, cart_contents)
    cart_contents.each do |id, quantity|
      candy = Candy.find(id)
      candy_order = CandyOrder.find_by(candy_id: id, order_id: order.id)
      subtotal = candy.price * quantity.to_i
      candy_order.update(quantity: quantity, sub_total: subtotal)
    end
  end
end
