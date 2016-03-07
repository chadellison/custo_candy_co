require "rails_helper"

RSpec.describe Order, type: :model do
  context "can have many candies" do
    it { should have_many(:candy_orders) }
    it { should have_many(:candies) }
    it { should belong_to(:user) }
  end

  it "it formats the date" do
    user = User.create(username: "jones", name: "jones", password: "password")
    order = Order.create(status: "pending", user_id: user.id)
    order.update(created_at: "2016-03-06 20:52:29")
    expect("Sunday March 6 2016").to eq order.format_date
  end

  it "calculates the total order price" do
    user = User.create(username: "jones", name: "jones", password: "password")
    order = Order.create(status: "pending", user_id: user.id)
    candy1 = create(:candy)
    candy2 = create(:candy)
    candy3 = create(:candy)
    order.candy_orders.create(candy_id: candy1.id, sub_total: candy1.price)
    order.candy_orders.create(candy_id: candy2.id, sub_total: candy2.price)
    order.candy_orders.create(candy_id: candy3.id, sub_total: candy3.price)
    price = candy1.price + candy2.price + candy3.price
    expect(order.total_to_dollars).to eq number_to_currency(price / 100.0)
  end
end
