require "rails_helper"
include ActionView::Helpers::NumberHelper

RSpec.describe CandyOrder, type: :model do
  context "price format" do
    it "turns cents into dollars" do
      candy_order = CandyOrder.new(sub_total: 5000)
      expect(candy_order.to_dollars).to eq("$50.00")
    end
  end

  context "finds candy title" do
    it "returns candy title" do
      candy = create(:candy)
      order = Order.create(status: "pending")
      order.candies << candy
      candy_order = CandyOrder.find_by(candy_id: candy.id)
      result = candy_order.candy_title
      expect(candy.title).to eq result
    end
  end

  context "finds candy status" do
    it "returns candy status" do
      candy = create(:candy)
      candy.update(status: "retired")
      order = Order.create(status: "pending")
      order.candies << candy
      candy_order = CandyOrder.find_by(candy_id: candy.id)
      result = candy_order.candy_status
      expect(candy.status).to eq result
    end
  end
end
