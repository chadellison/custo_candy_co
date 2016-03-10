class CustomCandy < ActiveRecord::Base
  belongs_to :order
  
  include ActionView::Helpers::NumberHelper
  def currency
    count = [nuts, fillings, spices, fruits].count do |addon|
      !addon.nil? && addon != ""
    end
    count + 4
  end

  def to_dollars
    number_to_currency(currency)
  end

  def describe
    "Delicious #{category} #{fillings} #{nuts} #{fruits} #{spices}"
  end
end
