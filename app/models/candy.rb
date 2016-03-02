class Candy < ActiveRecord::Base
  include ActionView::Helpers::NumberHelper

  def currency
    price / 100.0
  end

  def to_dollars
    number_to_currency(currency)
  end
end
