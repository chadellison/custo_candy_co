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

  def rating
    (ratings.all.map { |r| r.rating }.reduce(0, :+).to_f / ratings.count).round(2) 
  end
end
