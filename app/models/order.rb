class Order < ActiveRecord::Base
  include ActionView::Helpers::NumberHelper
  has_many :candy_orders
  has_many :candies, through: :candy_orders
  belongs_to :user

  def format_date
    created_at.strftime("%A %B %-d %Y")
  end

  def total_to_dollars
    total = candy_orders.inject(0) do |sum, candy_order|
      sum + candy_order.sub_total
    end
    number_to_currency(total / 100.0)
  end
end
