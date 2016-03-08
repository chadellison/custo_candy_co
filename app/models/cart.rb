class Cart
  include ActionView::Helpers::NumberHelper
  attr_reader :contents

  def initialize(initial_contents = nil)
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
      candy.currency * quantity
    end.sum
    number_to_currency(total_amount)
  end

  def find_candies(contents)
    contents.map do |id, _|
      Candy.find(id)
    end
  end

  def remove_candy(candy)
    contents.delete(candy.id.to_s)
  end

  def adjust_quantity(operator, candy_id)
    if operator == "-"
      contents[candy_id.to_s] -= 1 unless contents[candy_id] == 1
    else
      contents[candy_id.to_s] += 1
    end
  end
end
