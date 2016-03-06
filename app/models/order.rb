class Order < ActiveRecord::Base
  has_many :candy_orders
  has_many :candies, through: :candy_orders
  belongs_to :user

  def format_date
    
  end
end
