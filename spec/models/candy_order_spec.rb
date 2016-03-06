require "rails_helper"
include ActionView::Helpers::NumberHelper

RSpec.describe CandyOrder, type: :model do
  context "price format" do
    it "turns cents into dollars" do
      candy_order = CandyOrder.new(sub_total: 50.00)
      expect(candy_order.to_dollars).to eq("$50.00")
    end

    it "sum all subtotals" do
      candy_order1 = CandyOrder.create(sub_total: 50.00)
      candy_order2 = CandyOrder.create(sub_total: 50.00)
      candy_orders = [candy_order1, candy_order2]
      total = CandyOrder.total_price(candy_orders)
      expect(total).to eq 100.00
    end
  end

  context "finds candy title" do
    it "returns candy title" do
      candy = Candy.create(title: "yum")
      order = Order.create(status: "pending")
      order.candies << candy
      candy_order = CandyOrder.find_by(candy_id: candy.id)
      result = candy_order.candy_title(candy.id)
      expect(candy.title).to eq result
    end
  end

  context "finds candy status" do
    it "returns candy status" do
      candy = Candy.create(title: "yum", status: "retired")
      order = Order.create(status: "pending")
      order.candies << candy
      candy_order = CandyOrder.find_by(candy_id: candy.id)
      result = candy_order.candy_status(candy.id)
      expect(candy.status).to eq result
    end
  end
end
