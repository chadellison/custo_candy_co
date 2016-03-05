class Candy < ActiveRecord::Base
  include ActionView::Helpers::NumberHelper

  has_many :candy_orders
  has_many :orders, through: :candy_orders

  def currency
    price / 100.0
  end

  def to_dollars
    number_to_currency(currency)
  end
end
