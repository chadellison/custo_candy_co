module CartsHelper
  def path(candy)
    "<a href=\"/candies/#{candy.id}\">#{candy.title}</a>"
  end

  def adjust_quantity(operator)
    contents = @cart.contents
    if operator == "-"
      contents[params["candy_id"]] -= 1
      contents[params["candy_id"]] = 0 if contents[params["candy_id"]] < 0
    else
      contents[params["candy_id"]] += 1
    end
  end
end
