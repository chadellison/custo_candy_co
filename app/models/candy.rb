class Candy < ActiveRecord::Base
  include ActionView::Helpers::NumberHelper
  has_many :candy_orders
  has_many :orders, through: :candy_orders
  has_many :ratings

  validates :title, presence: true, uniqueness: true
  validates :description, presence: true
  validates :category_id, presence: true
  validates :status, presence: true

  before_save :set_image

  def set_image
    if image.nil? || image.empty?
      self.image = "http://www.travelandleisure.com/sites/default/files/styles/1600x1000/public/americancandy1015.jpg"
    end
  end

  def currency
    price / 100.0 if price
  end

  def to_dollars
    number_to_currency(currency)
  end

  def average_rating
    if ratings.last
      (ratings.sum(:rating) / ratings.count.to_f).round(2).to_s + " out of 5"
    else
      "Candy has not yet been rated"
    end
  end

  def retired?
    status == "Discontinued"
  end

  def out_of_stock?
    status == "Out of Stock"
  end
end
