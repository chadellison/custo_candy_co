class CustomCandy < ActiveRecord::Base
  def total_price
    count = [nuts, fillings, spices, fruits].count do |addon|
      addon != nil && addon != ""
    end
    count + 4
  end

  def to_dollars
    number_to_currency(total_price)
  end

end
