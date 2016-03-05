class CandyOrder < ActiveRecord::Base
  include ActionView::Helpers::NumberHelper

  belongs_to :candy
  belongs_to :order

  def to_dollars
    number_to_currency(sub_total)
  end

  def self.total_price(candy_orders)
    candy_orders.inject(0) { |sum, candy_order| sum + candy_order.sub_total }
  end

  def candy_title(candy_id)
    Candy.find(candy_id).title
  end

  def candy_status(candy_id)
    Candy.find(candy_id).status
  end
end
