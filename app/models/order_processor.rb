class OrderProcessor
  def initialize(order, cart)
    @order = order
    @cart = cart
  end

  def prepare_order
    @cart.contents["candy"].each do |id, quantity|
      candy = Candy.find(id)
      @order.candies << candy
      update_candy_order(id, quantity)
    end
  end

  def update_candy_order(id, quantity)
    candy = Candy.find(id)
    candy_order = CandyOrder.find_by(candy_id: id, order_id: @order.id)
    subtotal = candy.price * quantity.to_i
    candy_order.update(quantity: quantity, sub_total: subtotal)
  end
end
