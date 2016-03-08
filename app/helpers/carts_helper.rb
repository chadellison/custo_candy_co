module CartsHelper
  def path(candy)
    "<a href=\"/candies/#{candy.id}\">#{candy.title}</a>"
  end
end
