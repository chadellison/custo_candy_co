class Cart
  include ActionView::Helpers::NumberHelper
  attr_reader :contents

  def initialize(initial_contents = nil)
    @contents = initial_contents || {"candy" => {}, "custom" => {}}
  end

  def add_candy(candy_id, kind_of_candy)
    contents[kind_of_candy][candy_id.to_s] ||= 0
    contents[kind_of_candy][candy_id.to_s] += 1
  end

  def total
    if contents["candy"]
      candy = contents["candy"].values.sum
    else
      candy = 0
    end
    
    if contents["custom"]
      custom = contents["custom"].values.sum
    else
      custom = 0
    end
    candy + custom
    # contents["candy"].values.sum + contents["custom"].values.sum if contents["custom"]
  end

  def total_cost
    total_amount = contents["candy"].map do |id, quantity|
      candy = Candy.find(id.to_i)
      candy.currency * quantity
    end.sum
    number_to_currency(total_amount)
  end

  def remove_candy(candy)
    contents["candy"].delete(candy.id.to_s)
  end

  def adjust_quantity(operator, candy_id)
    if operator == "-"
      contents["candy"][candy_id.to_s] -= 1 unless contents[candy_id] == 1
    else
      contents["candy"][candy_id.to_s] += 1
    end
  end
end
