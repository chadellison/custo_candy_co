module CartsHelper
  def path(candy)
    "<a href=\"/candies/#{candy.id}\">#{candy.title}</a>"
  end

  def adjust_quantity(operator)
    contents = @cart.contents
    if operator == "-"
      contents[params["candy_id"]] -= 1 unless contents[params["candy_id"]] == 1
    else
      contents[params["candy_id"]] += 1
    end
  end
end
