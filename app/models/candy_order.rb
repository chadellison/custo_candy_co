class CandyOrder < ActiveRecord::Base
  include ActionView::Helpers::NumberHelper

  belongs_to :candy
  belongs_to :order

  def to_dollars
    number_to_currency(sub_total/100.0)
  end

  def candy_title
    candy.title
  end

  def candy_status
    candy.status
  end
end
