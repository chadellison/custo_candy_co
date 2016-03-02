require 'rails_helper'

RSpec.describe Candy, type: :model do
  context "price format" do
    it "turns cents into dollars" do
      candy = Candy.new(price: 5000)
      expect(candy.currency).to eq(50.00)
    end
  end
end
