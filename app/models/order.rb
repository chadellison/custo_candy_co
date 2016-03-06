class Order < ActiveRecord::Base
  has_many :candy_orders
  has_many :candies, through: :candy_orders
  belongs_to :user

  def format_date
    created_at.strftime("%A %B %-d %Y")
  end
end
