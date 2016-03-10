class CustomCandy < ActiveRecord::Base
  include ActionView::Helpers::NumberHelper
  def total_price
    count = [nuts, fillings, spices, fruits].count do |addon|
      addon != nil && addon != ""
    end
    count + 4
  end

  def to_dollars
    number_to_currency(total_price)
  end
  
  def describe
    "Delicious #{category} #{fillings} #{nuts} #{fruits} #{spices}"
  end
end
