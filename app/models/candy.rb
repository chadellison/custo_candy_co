class Candy < ActiveRecord::Base
  include ActionView::Helpers::NumberHelper

  def currency(price)
    price / 100.0
  end

  def to_dollars(price)
    number_to_currency(currency(price))
  end
end
