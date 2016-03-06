require "rails_helper"

RSpec.feature "User can see past order" do
  include ActionView::Helpers::NumberHelper
  it "User sees past order when they click on orders" do
    user = User.create(name: "Nate", username: "nate", password: "password")

    candy1 = create(:candy)
    candy2 = create(:candy)
    candy2.update(status: "retired")

    visit "/"

    cart = Cart.new
    order = Order.create

    [candy1, candy1, candy2, candy2].each { |candy| cart.add_candy(candy.id) }

    candy1_quantity = cart.contents[candy1.id.to_s]
    candy2_quantity = cart.contents[candy2.id.to_s]

    candy1_price = (candy1.price * candy1_quantity)
    candy2_price = (candy2.price * candy2_quantity)

    order.candies << candy1
    order.candies << candy2
    user.orders << order

    candy_order1 = CandyOrder.find_by(candy_id: candy1.id, order_id: order.id)
    candy_order1.update(quantity: candy1_quantity, sub_total: candy1_price)

    candy_order2 = CandyOrder.find_by(candy_id: candy2.id, order_id: order.id)
    candy_order2.update(quantity: candy2_quantity, sub_total: candy2_price)

    price1 = number_to_currency(candy_order1.sub_total)
    price2 = number_to_currency(candy_order2.sub_total)

    click_on "Login"
    fill_in "Username", with: "nate"
    fill_in "Password", with: "password"
    click_on "Sign in"

    click_on "Orders"

    expect("/orders").to eq current_path

    expect(page).to have_content "Order #{order.id} #{order.created_at}"

    click_on "#{order.id}"

    price = candy_order1.sub_total + candy_order2.sub_total

    expect(page).to have_content "Status: #{order.status}"
    expect(page).to have_content "Item: #{candy1.title},
                                  Quantity: #{candy1_quantity},
                                  Subtotal: #{price1},
                                  Status: #{candy1.status}"
    expect(page).to have_content "Item: #{candy2.title},
                                  Quantity: #{candy2_quantity},
                                  Subtotal: #{price2},
                                  Status: #{candy2.status}"
    expect(page).to have_content "Total order price: #{number_to_currency(price)}"
    expect(page).to have_content "Ordered at: #{order.created_at}"

    click_on "#{candy2.title}"

    expect(page).to have_content "#{candy2.title}"

    expect(current_path).to eq "/candies/#{candy2.id}"

    expect(page).to have_content "Item no longer available"
  end
end
