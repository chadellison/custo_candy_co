class OrderProcessor
  def initialize(order, cart)
    @order = order
    @cart = cart
  end

  def prepare_order
    if @cart.contents["custom"] && @cart.contents["candy"]
      prepare_custom_order
      prepare_candy_order
    elsif @cart.contents["custom"]
      prepare_custom_order
    else
      candy = prepare_candy_order
      update_candy_order(candy.keys.first, candy.values.first)
    end
  end

  def prepare_candy_order
    @cart.contents["candy"].each do |id, quantity|
      candy = Candy.find(id)
      @order.candies << candy
      update_candy_order(id, quantity)
    end
  end

  def prepare_custom_order
    @cart.contents["custom"].each do |id, quantity|
      custom = CustomCandy.find(id)
      custom.update(quantity: quantity)
      @order.custom_candies << custom
    end
  end

  def update_candy_order(id, quantity)
    candy = Candy.find(id)
    candy_order = CandyOrder.find_by(candy_id: id, order_id: @order.id)
    subtotal = candy.price * quantity.to_i
    candy_order.update(quantity: quantity, sub_total: subtotal)
  end
end
