class CandyOrder < ActiveRecord::Base
  include ActionView::Helpers::NumberHelper

  belongs_to :candy
  belongs_to :order

  def to_dollars
    number_to_currency(sub_total/100.0)
  end

  def self.format_to_dollars(total)
    "$#{sprintf("%.2f", total/100.0)}"
  end

  def self.calculate_total_price(candy_orders)
    total = candy_orders.inject(0) do |sum, candy_order|
      sum + candy_order.sub_total
    end
   format_to_dollars(total)
  end

  def candy_title(candy_id)
    Candy.find(candy_id).title
  end

  def candy_status(candy_id)
    Candy.find(candy_id).status
  end
end
