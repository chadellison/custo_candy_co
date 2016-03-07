class Candy < ActiveRecord::Base
  include ActionView::Helpers::NumberHelper

  has_many :candy_orders
  has_many :orders, through: :candy_orders
  has_many :ratings

  validates :title, presence: true, uniqueness: true
  validates :description, presence: true
  validates :category_id, presence: true
  validates :status, presence: true

  def currency
    price / 100.0 if price
  end

  def to_dollars
    number_to_currency(currency)
  end

  def average_rating
    (ratings.sum(:rating) / ratings.count.to_f).round(2) if ratings.last
  end
end
