class Order < ActiveRecord::Base
  include ActionView::Helpers::NumberHelper
  has_many :candy_orders
  has_many :candies, through: :candy_orders
  has_many :custom_candies
  belongs_to :user

  def format_date
    created_at.strftime("%A %B %-d %Y")
  end

  def total_to_dollars
    total = candy_orders.inject(0) do |sum, candy_order|
      sum + candy_order.sub_total
    end
    unless custom_candies.empty? && custom_candies.nil?
      total = custom_candies.inject(total) do |sum, custom_candy|
         sum + (custom_candy.currency * 100)
       end
    end

    number_to_currency(total / 100.0)
  end
end
