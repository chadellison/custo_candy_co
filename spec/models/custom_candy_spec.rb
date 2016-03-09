require "rails_helper"

RSpec.describe CustomCandy, type: :model do
  describe CustomCandy do
    it "counts elements and turn to dollars" do
    custom_candy1 = CustomCandy.new(title: "yo", category: "chocloate",
                                    fillings: "whiskey", spices: "cayenne",
                                    nuts: "almonds", fruits: "cherries")
    custom_candy2 = CustomCandy.new(title: "yo", category: "chocloate",
                                    fillings: "whiskey", spices: "cayenne")
    result1 = custom_candy1.to_dollars
    result2 = custom_candy2.to_dollars

    expect("$8.00").to eq result1
    expect("$6.00").to eq result2
    end
  end
end
