require "rails_helper"

RSpec.feature "User can see past order" do
  include ActionView::Helpers::NumberHelper
  it "User sees past order when they click on orders" do
    User.create(name: "Nate", username: "nate", password: "password")
    candy1 = create(:candy)
    candy2 = create(:candy)

    visit "/"

    cart = Cart.new

    cart.add_candy(candy1.id)
    cart.add_candy(candy1.id)
    cart.add_candy(candy2.id)
    cart.add_candy(candy2.id)

    candy1_quantity = cart.contents[(candy1.id).to_s]
    candy2_quantity = cart.contents[(candy2.id).to_s]

    candy1_price = (candy1.price * candy1_quantity)
    candy2_price = (candy2.price * candy2_quantity)

    price1 = number_to_currency(candy1_price)
    price2 = number_to_currency(candy2_price)

    click_on "Login"
    fill_in "Username", with: "nate"
    fill_in "Password", with: "password"
save_and_open_page
    click_on "Orders"

    expect("/orders").to eq current_path

    expect(page).to have_content "Order #{order.id} #{order.created_at}"

    click_on "#{order.id}"

    expect(page).to have_content "Status: Ordered"
    expect(page).to have_content "Item: #{candy1.title}, Quantity: #{candy1_quantity}, Total item price: #{price1}"
    expect(page).to have_content "Item: #{candy2.title}, Quantity: #{candy2_quantity}, Total item price: #{price2}"
    expect(page).to have_content "Total order price: #{price1 + price2}"
    expect(page).to have_content "Ordered #{order.created_at}"
  end
end
