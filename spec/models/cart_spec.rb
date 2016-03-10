require "rails_helper"

RSpec.describe Cart, type: :model do
  include ActionView::Helpers::NumberHelper
  it "returns content" do
    cart = Cart.new("candy" => { "1" => 1 })
    expect("1" => 1).to eq cart.contents["candy"]
  end

  it "can add candy" do
    cart = Cart.new("candy" => { "1" => 1 })

    cart.add_candy(1, "candy")
    cart.add_candy(2, "candy")

    expect("1" => 2, "2" => 1).to eq cart.contents["candy"]
  end

  it "can total candy in cart" do
    cart = Cart.new("candy" => { "1" => 1, "2" => 5, "3" => 4 })

    expect(cart.total).to eq 10
  end

  it "can returns the total cost of all items" do
    candy1 = create(:candy)
    candy2 = create(:candy)
    candy3 = create(:candy)
    cart = Cart.new("candy" => {
                    candy1.id.to_s => 2,
                    candy2.id.to_s => 5,
                    candy3.id.to_s => 4
                                      })

    candy1_cost = candy1.price * 2
    candy2_cost = candy2.price * 5
    candy3_cost = candy3.price * 4
    cost = (candy1_cost + candy2_cost + candy3_cost) / 100.0
    expect(number_to_currency(cost.to_s)).to eq cart.total_cost
  end

  it "can remove a candy" do
    candy1 = create(:candy)
    candy2 = create(:candy)
    candy3 = create(:candy)
    cart = Cart.new("candy" => {
                    candy1.id.to_s => 2,
                    candy2.id.to_s => 5,
                    candy3.id.to_s => 4
                                      })

    merchandise = { candy2.id.to_s => 5, candy3.id.to_s => 4 }
    cart.remove_candy(candy1)
    expect(cart.contents["candy"]).to eq(merchandise)
  end
end
