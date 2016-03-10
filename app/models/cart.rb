
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
    contents["candy"] ? candy = contents["candy"].values.sum : candy = 0
    contents["custom"] ? custom = contents["custom"].values.sum : custom = 0

    candy + custom
  end

  def total_cost
    if contents["candy"] && contents["custom"]
      total = tally_price(contents["candy"]) + tally_price(contents["custom"])
    else
      candy_type = contents["candy"] || contents["custom"]
      total = tally_price(candy_type)
    end
    number_to_currency(total)
  end

  def tally_price(candy_type)
    candy_type.map do |id, quantity|
      candy = find_candy(candy_type, id)
      candy.currency * quantity
    end.sum
  end

  def find_candy(candy_type, id)
    if candy_type == contents["candy"]
      Candy.find(id)
    else
      CustomCandy.find(id)
    end
  end

  def remove_candy(candy)
    if candy.class == Candy
      contents["candy"].delete(candy.id.to_s)
    else
      contents["custom"].delete(candy.id.to_s)
    end
  end

  def find_candy_type(candy)
    if candy.class == Candy
      contents["candy"]
    else
      contents["custom"]
    end
  end

  def adjust_quantity(operator, candy)
    candy_type = find_candy_type(candy)
    if operator == "-"
      candy_type[candy.id.to_s] -= 1 unless candy_type[candy.id] == 1
    else
      candy_type[candy.id.to_s] += 1
    end
  end
end
