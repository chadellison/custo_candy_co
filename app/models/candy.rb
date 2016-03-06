class Candy < ActiveRecord::Base
  include ActionView::Helpers::NumberHelper

  has_many :candy_orders
  has_many :orders, through: :candy_orders

  validates :title, presence: true, uniqueness: true
  validates :description, presence: true
  validates :category_id, presence: true

  def currency
    price / 100.0 if price
  end

  def to_dollars
    number_to_currency(currency)
  end
end
