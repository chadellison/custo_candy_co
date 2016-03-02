class Candy < ActiveRecord::Base
  def currency(price)
    price / 100.0
  end
end
