require "rails_helper"

RSpec.describe Cart, type: :model do
  it "returns content" do
    cart = Cart.new("1" => 1)
    expect("1" => 1).to eq cart.contents
  end

  it "can add candy" do
    cart = Cart.new("1" => 1)

    cart.add_candy(1)
    cart.add_candy(2)

    expect("1" => 2, "2" => 1).to eq cart.contents
  end

  it "can total candy in cart" do
    cart = Cart.new("1" => 1, "2" => 5, "3" => 4)

    expect(10).to eq cart.total
  end

  it "can returns the total cost of all items" do
    candy1 = create(:candy)
    candy2 = create(:candy)
    candy3 = create(:candy)
    cart = Cart.new(candy1.id.to_s => 2,
                    candy2.id.to_s => 5,
                    candy3.id.to_s => 4)

    candy1_cost = candy1.price * 2
    candy2_cost = candy2.price * 5
    candy3_cost = candy3.price * 4
    expect("$#{(candy1_cost + candy2_cost + candy3_cost) / 100.0 }"
          ).to eq cart.total_cost
  end

  it "can remove a candy" do
    candy1 = create(:candy)
    candy2 = create(:candy)
    candy3 = create(:candy)
    cart = Cart.new(candy1.id.to_s => 2,
                    candy2.id.to_s => 5,
                    candy3.id.to_s => 4)

    cart.remove_candy(candy1)
    expect(cart.contents).to eq(candy2.id.to_s => 5, candy3.id.to_s => 4)
  end
end
