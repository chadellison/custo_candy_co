require "rails_helper"

RSpec.describe Order, type: :model do
  context "can have many candies" do
    it { should have_many(:candies) }
    it { should belong_to(:user) }
  end

  it "it formats the date" do
    user = User.create(username: "jones", name: "jones", password: "password")
    order = Order.create(status: "pending", user_id: user.id)
    order.update(created_at: "2016-03-06 20:52:29")
    expect("Sunday March 6 2016").to eq order.format_date
  end
end
