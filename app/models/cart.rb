class Cart
  include ActionView::Helpers::NumberHelper
  attr_reader :contents

  def initialize(initial_contents)
    @contents = initial_contents || {}
  end

  def add_candy(candy_id)
    contents[candy_id.to_s] ||= 0
    contents[candy_id.to_s] += 1
  end

  def total
    contents.values.sum
  end

  def total_cost
    total_amount = contents.map do |id, quantity|
      candy = Candy.find(id.to_i)
      candy.currency(candy.price) * quantity
    end.sum
    number_to_currency(total_amount)
  end
end
